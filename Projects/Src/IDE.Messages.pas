unit IDE.Messages;

{
  Inno Setup
  Copyright (C) 1997-2025 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  Compiler IDE Messages

  Some but not all language-specific text used by the Compiler IDE is in here.
}

interface

const
  SNewLine = #13#10;  { line break }
  SNewLine2 = #13#10#13#10;  { double line break }

  { Compiler-specific messages }
  SCompilerCommandLineHelp3 = '命令行用法：' + SNewLine +
    SNewLine +
    'iside /cc <脚本文件>' + SNewLine +
    'iside /wizard <向导名称> <脚本文件>' + SNewLine +
    SNewLine +
    '示例：' + SNewLine +
    'iside /cc c:\isetup\sample32\sample1.iss' + SNewLine +
    'iside /cc "C:\Inno Setup\Sample32\My script.iss"' + SNewLine +
    'iside /wizard "My Script Wizard" c:\temp.iss';

  { Compiler form labels }
  SCompilerFormCaption = 'Inno Setup 编译器';
  SCompilerScriptFileLabel = '脚本文件(&F)：';
  SCompilerStatusLabel = '状态消息(&M)：';
  SCompilerScriptBrowseButton = '浏览(&B)...';
  SCompilerStartButton = '开始(&S)';
  SCompilerExitButton = '退出(&X)';
  SCompilerOpenFilter = 'Inno Setup 脚本文件 (*.iss)|*.iss|所有文件|*.*';
  SCompilerExampleScripts = '示例脚本...';
  SCompilerMoreFiles = '更多文件...';

  { Compiler Script Wizard }
  SWizardDefaultName = 'Inno Setup 脚本向导';
  SWizardWelcome = '欢迎';
  SWizardAppInfo = '应用程序信息';
  SWizardAppInfo2 = '请指定有关您的应用程序的一些基本信息。';
  SWizardAppDir = '应用程序文件夹';
  SWizardAppDir2 = '请指定有关您的应用程序的文件夹信息。';
  SWizardAppFiles = '应用程序文件';
  SWizardAppFiles2 = '请指定属于您的应用程序的文件。';
  SWizardAppFiles3 = '请指定源文件夹。';
  SWizardAppFilesSubDirsMessage = '是否也要包含 "%s" 子文件夹中的文件？';
  SWizardAppFilesDownloadSourcePrompt = 'URL：';
  SWizardAppFilesDownloadExtractArchiveMessage = '要下载的文件是否为应该解压缩的压缩文件？';
  SWizardAppFilesDownloadDestNamePrompt = '文件名：';
  SWizardAppFilesDownloadArchiveDestNamePrompt = '文件名（扩展名应与压缩文件格式匹配）：';
  SWizardAppFilesDownloadExternalSizePrompt = '文件的近似大小（以兆字节为单位）：';
  SWizardAppExeFilter = '应用程序文件 (*.exe)|*.exe|所有文件|*.*';
  SWizardAppExeDefaultExt = 'exe';
  SWizardAppAssoc = '应用程序文件关联';
  SWizardAppAssoc2 = '请指定应该为您的应用程序创建哪些文件关联。';
  SWizardAppIcons = '应用程序快捷方式';
  SWizardAppIcons2 = '请指定应该为您的应用程序创建哪些快捷方式。';
  SWizardAppDocs = '应用程序文档';
  SWizardAppDocs2 = '请指定安装程序在安装期间应该显示哪些文档文件。';
  SWizardAppDocsFilter = '文档文件 (*.rtf,*.txt)|*.rtf;*.txt|所有文件|*.*';
  SWizardAppDocsDefaultExt = 'rtf';
  SWizardAppRegFilter = '注册表文件 (*.reg)|*.reg|所有文件|*.*';
  SWizardAppRegDefaultExt = 'reg';
  SWizardPrivilegesRequired = '安装程序安装模式';
  SWizardPrivilegesRequired2 = '请指定安装程序应该以哪种安装模式运行。';
  SWizardAppRegistry = '应用程序注册表键和值';
  SWizardAppRegistry2 = '请指定属于您的应用程序的注册表键和值。';
  SWizardLanguages = '安装程序语言';
  SWizardLanguages2 = '请指定应该包含哪些安装程序语言。';
  SWizardCompiler = '编译器设置';
  SWizardCompiler2 = '请指定一些基本的编译器设置。';
  SWizardCompilerSetupIconFileFilter = '图标文件 (*.ico)|*.ico|所有文件|*.*';
  SWizardCompilerSetupIconFileDefaultExt = 'ico';
  SWizardCompilerOutputDir = '请指定文件夹。';
  SWizardWizardStyle = '向导样式';
  SWizardWizardStyle2 = '请指定应该使用哪种向导样式。';
  SWizardISPP = 'Inno Setup 预处理器';
  SWizardISPP2 = '请指定是否应该使用 Inno Setup 预处理器。';
  SWizardISPPLabel = '[name] 可以使用 #define 编译器指令来简化您的脚本。虽然这不是必需的，但它会使以后手动更改脚本更容易。' + SNewLine2 + '您希望 [name] 使用 #define 编译器指令吗？';
  SWizardISPPCheck = '是，使用 #define 编译器指令(&Y)';
  SWizardFinished = '完成';

  SWizardNextButton = '下一步(&N)';
  SWizardFinishButton = '完成(&F)';
  SWizardCancelMessage = '[name] 尚未完成。如果您现在退出，将不会生成新的脚本文件。'#13#13'退出 [name]？';

  SWizardAllFilesFilter = '所有文件|*.*';

  SWizardAppNameError = '请指定应用程序名称。';
  SWizardAppVersionError = '请指定应用程序版本。';
  SWizardAppRootDirError = '请指定应用程序目标基础文件夹。';
  SWizardAppDirNameError = '请指定应用程序文件夹名称。';
  SWizardAppExeError = '请指定应用程序主可执行文件。';
  SWizardAppGroupNameError = '请指定应用程序开始菜单组名称。';
  SWizardFileDestRootDirError = '请指定目标基础文件夹。';
  SWizardFileAppDestRootDirError = '请指定除应用程序文件夹之外的目标基础文件夹';
  SWizardLanguagesSelError = '请至少选择一种语言。';

  SWizardScriptHeader = '; 脚本由 [name] 生成。' + SNewLine  + '; 有关创建 INNO SETUP 脚本文件的详细信息，请参阅文档！';

  { Status messages }
  SCompilerStatusStarting = '*** 开始编译。  [%s]';
  SCompilerStatusFinished = '*** 完成。  [%s，已用时间 %s]';
  SCompilerStatusErrorAborted = '*** 编译已中止。';
  SCompilerStatusReset = '*** 达到日志大小限制，列表已重置。';

  SCompilerNeedCompiledExe = '此时无法运行安装程序。请先成功编译安装程序，并启用输出';
  SCompilerNeedUninstExe = '此时无法运行卸载程序。请先成功运行安装程序完成安装';
  SCompilerExecuteSetupError2 = '执行 "%s" 时出错：' + SNewLine2 + '%d：%s';

  { Line parsing }
  SCompilerIllegalNullChar = '第 %d 行存在非法空字符';

implementation

end.
