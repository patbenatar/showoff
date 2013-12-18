# jQuery Showoff

Showoff is a jQuery plugin that uses the HTML5 FileReader API to make it easy
to preview images before uploading them to the server.

## Demo

http://patbenatar.github.com/showoff

## Installation

Grab the latest code from the `lib` directory.

## Basic Usage

```html
<input type="file" id="myFile">
<img id="myImage">
```

```javascript
$("#myFile").showoff({
  destination: $("#myImage")
});
```

## Options & Callbacks

#### `destination`

The `img` element that you would like the preview to use.

* __Required:__ Yes
* __Type:__ jQuery Object, selector string
* __Default:__ `null`

#### `onNoBrowserSupport`

Called during initialization if browser has no FileReader API support.

* __Required:__ No
* __Type:__ Function()
* __Default:__ `null`

#### `filetypeMatcher`

Used to validate input filetype.

* __Required:__ No
* __Type:__ RegExp Object, Regular Expression Literal
* __Default:__

```javascript
/^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i
```

#### `onInvalidFiletype`

Called while validating the file if the filetype is not supported by the `filetypeMatcher` regex.

* __Required:__ No
* __Type:__ Function(<String> filetype)
* __Default:__ `null`

#### `onFileReaderError` _Function_

Called if FileReader errors while trying to read the file.

* __Required:__ No
* __Type:__ Function(<DOMError> error)
* __Default:__ `null`

#### `onDestinationUpdate`

Called after updating the `src` attribute of the `destination` element.

* __Required:__ No
* __Type:__ Function()
* __Default:__ `null`

## API

### `isSupported`

Does the current browser support the functionality required by Showoff?

```javascript
Showoff.isSupported()
```

## Contributing

1. Fork and clone your fork
1. Run `$ cake build:development` to automatically compile changes made in `src/` to `development/lib/`
1. Make changes to the library files in `src/`
1. Test those changes in `development/example.html`
1. Pull request!

If you'd like to build your own package for release, you can edit the version number
in `VERSION` and run `$ cake build` to version and compile to `lib/`
