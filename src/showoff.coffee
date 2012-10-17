class Showoff

  settings:
    destination: null
    onNoBrowserSupport: null
    filetypeMatcher: /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i
    onInvalidFiletype: null
    onFileReaderError: null
    onDestinationUpdate: null

  $el: null
  fileReader: null

  constructor: (@$el, options = {}) ->
    @options = $.extend({}, @settings, options)

    throw "You must initialize on a file upload field" unless @$el.is("input[type=file]")
    throw "Destination must be an img element" unless @options.destination? && @options.destination.is("img")

    # Make sure browser supports all the cool HTML5 features we want
    unless window.File && window.FileReader && window.FileList && window.Blob
      @options.onNoBrowserSupport() if @options.onNoBrowserSupport?
      return

    # Get jQuery object for destination if initialized as selector string
    if typeof @options.destination == "string"
      @options.destination = $(@options.destination)

    @fileReader = new FileReader
    @fileReader.onload = @_onFileReaderLoad

    @$el.change @_onChange

  _onChange: (event) =>
    file = event.target.files[0]
    @_processFile(file) if file?

  _processFile: (file) ->
    if @options.filetypeMatcher? && !@options.filetypeMatcher.test(file.type)
      @options.onInvalidFiletype(file.type) if @options.onInvalidFiletype?
      return
    @fileReader.readAsDataURL(file)

  _onFileReaderError: (error) =>
    @options.onFileReaderError(error) if @options.onFileReaderError?

  _onFileReaderLoad: (event) =>
    @_setDestinationSrc(event.target.result)

  _setDestinationSrc: (src) ->
    @options.destination.attr("src", src)
    @options.onDestinationUpdate() if @options.onDestinationUpdate?

