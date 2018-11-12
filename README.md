This is directory for my setting.

## GoogleChrome
[Download](https://www.google.co.jp/chrome/index.html)
- extentions
	- Vimium  
		work like vim   
		[link](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)    
		type in Custome key mapping    
		>map h goBack   
		>map l goForward   
		>map H previousTab   
		>map L nextTab   
		>map i LinkHints.activateMode    
		>map I LinkHints.activateModeToOpenInNewTab    

	- Markdown Preview Plus  
		For display markdown   
		[link](https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl?hl=ja)	

	- Google 翻訳   
		Translate    
		[link](https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb?hl=ja)    

	- ad bloackk 

# zsh-syntax-highliting
pathの下線をやめる

```
vi ~/.zplug/repos/zsh-users/zsh-syntax-highlighting/highlighters/main/main-highlighter.zsh
```
#: ${ZSH_HIGHLIGHT_STYLES[path]:=underline}
