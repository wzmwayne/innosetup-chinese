unit Compiler.Messages;

{
  Inno Setup
  Copyright (C) 1997-2025 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  Compiler Messages

  All language-specific text used by the compiler is in here. If you want to
  translate it into another language, all you need to change is this unit.
}

interface

const
  SNewLine = #13#10;  { line break }
  SNewLine2 = #13#10#13#10;  { double line break }
  
  { Compiler-specific messages }
  SCompilerVersion = 'version %s';

  SCompilerNotOnWin32s = 'The 32-bit compiler will not run on Win32s.';

  { Status messages }
  SCompilerStatusPreprocessing = '预处理中';
  SCompilerStatusPreprocessorStatus = '   %s';
  SBuiltinPreprocessStatusIncludingFile = '包含文件：%s';
  SCompilerStatusCreatingOutputDir = '创建输出目录：%s';
  SCompilerStatusCreatingSignedUninstallerDir = '创建已签名的卸载程序目录：%s';
  SCompilerStatusDeletingPrevious = '从输出目录中删除 %s';
  SCompilerStatusParsingSectionLine = '解析 [%s] 节，第 %d 行';
  SCompilerStatusParsingSectionLineFile = '解析 [%s] 节，文件 %s 的第 %d 行';
  SCompilerStatusFilesVerInfo = '   读取版本信息：%s';
  SCompilerStatusReadingFile = '读取文件（%s）';
  SCompilerStatusPreparingSetupExe = '准备安装程序可执行文件';
  SCompilerStatusSkippingPreparingSetupExe = '跳过准备安装程序可执行文件，输出已禁用';
  SCompilerStatusSignedUninstallerNew = '   创建新的已签名卸载程序文件：%s';
  SCompilerStatusSignedUninstallerExisting = '   使用现有的已签名卸载程序文件：%s';
  SCompilerStatusDeterminingCodePages = '确定语言代码页';
  SCompilerStatusConvertCodePage = '   转换代码页：%d';
  SCompilerStatusReadingDefaultMessages = '从 Default.isl 读取默认消息';
  SCompilerStatusParsingMessages = '解析 [LangOptions]、[Messages] 和 [CustomMessages] 节';
  SCompilerStatusReadingCode = '读取 [Code] 节';
  SCompilerStatusCompilingCode = '编译 [Code] 节';
  SCompilerStatusReadingInFile = '   读取文件：%s';
  SCompilerStatusReadingInScriptMsgs = '   脚本文件中的消息';
  SCompilerStatusCreateSetupFiles = '创建安装文件';
  SCompilerStatusSkippingCreateSetupFiles = '跳过创建安装文件，输出已禁用';
  SCompilerStatusCreateManifestFile = '创建清单文件';
  SCompilerStatusFilesCompressing = '   正在压缩：%s';
  SCompilerStatusFilesCompressingVersion = '   正在压缩：%s   (%u.%u.%u.%u)';
  SCompilerStatusFilesStoring = '   正在存储：%s';
  SCompilerStatusFilesStoringVersion = '   正在存储：%s   (%u.%u.%u.%u)';
  SCompilerStatusVerified = '   验证成功';
  SCompilerStatusVerificationDisabled = '   验证已禁用！';
  SCompilerStatusCompressingSetupExe = '   正在压缩安装程序可执行文件';
  SCompilerStatusUpdatingVersionInfo = '   正在更新版本信息（%s）';
  SCompilerStatusUpdatingManifest = '   正在更新清单（%s）';
  SCompilerStatusUpdatingIcons = '   正在更新图标（%s）';
  SCompilerStatusUpdatingIconsAndVsf = '   正在更新图标和样式（%s）';
  SCompilerStatusOutputFileInUse = '   输出文件似乎正在使用中（%d）。正在重试：%s';
  SCompilerStatusCreatingDisk = '   正在创建磁盘 %d';
  SCompilerStatusError = '错误：';
  SCompilerStatusWarning = '警告：';
  SCompilerStatusSigningSetup = '   正在为安装程序可执行文件签名';
  SCompilerStatusSigningSourceFile = '   正在签名：%s';
  SCompilerStatusSourceFileAlreadySigned = '   跳过签名，已签名：%s';
  SCompilerStatusSigning = '   正在运行签名工具 %s：%s';
  SCompilerStatusSigningWithDelay = '   正在运行签名工具 %s（延迟 %d 毫秒）：%s';
  SCompilerStatusWillRetrySigning = '   签名工具命令失败（%s）。将重试（剩余 %d 次尝试）。';

  SCompilerSuccessfulMessage2 = '安装程序镜像已成功创建在输出目录中：' + SNewLine +
    '%s' + SNewLine +
    SNewLine +
    '您想要现在测试安装吗？';
  SCompilerSuccessfulTitle = '编译成功';

  SCompilerAborted = '编译已中止。请修正问题并重试。';

  { Fatal errors }
  SCompilerScriptMissing2 = '指定的脚本文件不存在';
  SCompilerOutputNotEmpty2 = '在编译任何非安装程序文件之前，输出目录必须为空。名为 Setup.* 的文件会在编译开始时自动删除。';
  SCompilerUnknownFilenamePrefix = '未知的文件名前缀 "%s"';
  SCompilerSourceFileDoesntExist = '源文件 "%s" 不存在';
  SCompilerSourceFileNotSigned = '源文件 "%s" 未签名';
  SCompilerSourceFileVerificationFailed = '源文件 "%s" 验证失败：%s';
  SCompilerVerificationSignatureDoesntExist = '签名文件 "%s" 不存在';
  SCompilerVerificationSignatureMalformed = '签名文件 "%s" 格式错误';
  SCompilerVerificationSignatureBad = '签名文件 "%s" 无效';
  SCompilerVerificationKeyNotFound = '签名文件 "%s" 使用了未知密钥';
  SCompilerVerificationFileNameIncorrect = '文件名不正确';
  SCompilerVerificationFileSizeIncorrect = '文件大小不正确';
  SCompilerVerificationFileHashIncorrect = '文件哈希值不正确';
  SCompilerCopyError3a = '无法将 "%s" 复制到 "%s".' + SNewLine2 + '错误 %s';
  SCompilerCopyError3b = '无法将 "%s" 复制到 "%s".' + SNewLine2 + '错误 %d：%s';
  SCompilerReadError = '无法读取 "%s".' + SNewLine2 + '错误：%s';
  SCompilerCompressInternalError = '压缩过程中发生内部错误：%s';
  SCompilerNotEnoughSpaceOnFirstDisk = '第一张磁盘空间不足，无法复制所有必需文件';
  SCompilerSetup0Mismatch = '内部错误 SC1';
  SCompilerMustUseDiskSpanning = '要创建大于 %d 字节的单个 Setup.exe 安装程序，必须启用磁盘分卷，因为这已接近 Windows 支持的最大值';
  SCompilerCompileCodeError = '尝试编译 [Code] 节时发生错误：' + SNewLine2 + '%s';
  SCompilerFunctionFailedWithCode = '%s 失败。错误 %d：%s';
  SCompilerCheckPrecompiledFileTrustError = '%s' + SNewLine2 + '要禁用此验证，请设置 [Setup] 节指令 "DisablePrecompiledFileVerifications"。在继续之前，请确保文件既未损坏也未被人篡改。';

  { [Setup] }
  SCompilerUnknownDirective = '无法识别的 [%s] 节指令 "%s"';
  SCompilerEntryObsolete = '在此版本的 Inno Setup 中，[%s] 节指令 "%s" 已过时并被忽略。';
  SCompilerEntrySuperseded2 = '在此版本的 Inno Setup 中，[%s] 节指令 "%s" 已被 "%s" 取代。';
  SCompilerEntryMissing2 = '未指定必需的 [%s] 节指令 "%s"';
  SCompilerEntryInvalid2 = '[%s] 节指令 "%s" 的值无效';
  SCompilerEntryValueUnsupported = '如果使用了 "%s" 标志，[%s] 节指令 "%s" 的值不能为 "%s"。';
  SCompilerEntryValueUnsupported2 = '如果使用了 "%s" 压缩方法，[%s] 节指令 "%s" 的值不能为 "%s"。';
  SCompilerEntryAlreadySpecified = '已指定 [%s] 节指令 "%s"';
  SCompilerAppVersionOrAppVerNameRequired = '[Setup] 节必须包含 AppVersion 或 AppVerName 指令';
  SCompilerMinVersionWinMustBeZero = 'MinVersion 指定的最低非 NT 版本必须为 0。（不再支持 Windows 95/98/Me。）';
  SCompilerMinVersionNTTooLow = 'MinVersion 指定的最低版本必须至少为 %s，否则安装程序将无法运行。（不再支持 Windows Vista/Server 2008。）';
  SCompilerOnlyBelowVersionNTTooLow = '如果不为 0，OnlyBelowVersion 指定的最低版本必须高于 %s，否则安装程序将无法运行。（不再支持 Windows Vista/Server 2008。）';
  SCompilerMinVersionRecommendation = '最低版本设置为 %s，但建议使用 %s（默认值）。';
  SCompilerDiskSliceSizeInvalid = 'DiskSliceSize 必须在 %d 和 %d 之间，或为 "max"';
  SCompilerDiskClusterSizeInvalid = 'DiskClusterSize 必须在 1 和 32768 之间';
  SCompilerInstallModeObsolete = '在此版本的 Inno Setup 中，[%s] 节指令 "%s" 已过时并被忽略。请改用命令行参数。';
  SCompilerMessagesFileObsolete = 'MessagesFile 指令已过时，不再支持。请改用 [Languages] 节。';
  SCompilerMustUseDisableStartupPrompt = '当 AppName 包含常量时，必须将 DisableStartupPrompt 设置为 "yes"';
  SCompilerMustNotUsePreviousLanguage = '当 AppId 包含常量时，必须将 UsePreviousLanguage 设置为 "no"';
  SCompilerMustNotUsePreviousPrivileges = '当 AppId 包含常量且 PrivilegesRequiredOverridesAllowed 允许 "dialog" 时，必须将 UsePreviousPrivileges 设置为 "no"';
  SCompilerDirectiveNotUsingDefault = '[%s] 节指令 "%s" 未使用默认值，因为 %s 包含常量。';
  SCompilerDirectiveNotUsingPreferredDefault = '[%s] 节指令 "%s" 默认为 %s，因为 %s 包含常量。';
  SCompilerDirectivePatternTooLong = '[%s] 节指令 "%s" 包含的模式过长';
  SCompilerOutputBaseFileNameSetup = '不建议将 [Setup] 节指令 "OutputBaseFileName" 设置为 "setup"：Windows 应用程序兼容性会对所有名为 "setup.exe" 的可执行文件使用垫片来加载额外的 DLL，例如 version.dll。' + ' Windows 以不安全的方式加载这些 DLL，可能会被劫持。请使用其他名称，例如 "mysetup"。';
  SCompilerWizImageRenamed = '向导图像 "%s" 已重命名。请改用 "%s" 或考虑删除该指令以使用现代内置向导图像。';
  SCompilerArchitectureIdentifierInvalid = '架构标识符 "%s" 无效';
  SCompilerArchitectureIdentifierDeprecatedWarning = '架构标识符 "%s" 已过时。' +
    '将替换为 "%s"，但请注意，在大多数情况下首选 "%s"。有关详细信息，请参阅帮助文件中的"架构标识符"主题。';
  SCompilerRegTypeLibArchitectureMismatch = '%d 位安装程序无法注册 %d 位类型库。';

  { Signing }
  SCompilerSignatureNeeded = '已启用已签名卸载程序模式。使用外部代码签名工具，请将您的数字签名附加到以下可执行文件：' + SNewLine2 + '%s' + SNewLine2 +
    '然后重新编译';
  SCompilerSignatureInvalid = '数字签名似乎无效';
  SCompilerSignedFileContentsMismatchRetry = '已签名文件的内容：' +
    SNewLine2 + '%s' + SNewLine2 + '与原文件意外不同。请尝试删除已签名文件并重新编译。如果此错误持续存在，请报告该问题';
  SCompilerSignedFileContentsMismatch = '已签名文件的内容：' +
    SNewLine2 + '%s' + SNewLine2 + '与原文件意外不同';
  SCompilerNoSetupLdrSignError = '当 UseSetupLdr 设置为 "no" 时，不能设置 SignTool 和 SignedUninstaller 指令';
  SCompilerSignToolFileNameSequenceNotFound = '无法运行签名工具 %s：缺少 $f 序列。';
  SCompilerSignToolCreateProcessFailed = '执行签名工具命令失败。' +
    SNewLine2 + '错误 %d：%s';
  SCompilerSignToolNonZeroExitCode = '签名工具命令失败，退出代码为 0x%x';
  SCompilerSignToolSucceededButNoSignature = '签名工具命令返回了 ' +
    '退出代码 0，但文件没有数字签名';

  { Line parsing }
  SCompilerLineTooLong = '行太长';
  SCompilerSectionTagInvalid = '无效的节标记';
  SCompilerSectionBadEndTag = '不在 "%s" 节内，但遇到了该节的结束标记';
  SCompilerTextNotInSection = '文本不在节内';
  SCompilerInvalidDirective = '无效的编译器指令' +
    SNewLine2 + '要使用除 ''#include'' 之外的编译器指令，您需要 Inno Setup 预处理器（ISPP），但目前未安装。' +
    SNewLine2 + '要安装 ISPP，请重新安装 Inno Setup 并启用 ISPP 选项。';
  SCompilerErrorOpeningIncludeFile = '无法打开包含文件 "%s"：%s';
  SCompilerRecursiveInclude = '"%s" 的递归包含';
  SCompilerIllegalNullChar = '第 %d 行存在非法空字符';
  SCompilerISPPMissing = 'ISPP.dll 缺失';

  { Constant checks }
  SCompilerTwoBraces = '如果您想嵌入单个 "{" 而不是常量，请使用两个连续的 "{" 字符';
  SCompilerUnknownConst = '未知常量 "%s".' +
    SNewLine2 + SCompilerTwoBraces;
  SCompilerUnterminatedConst = '常量 "%s" 的末尾缺少 "}".' +
    SNewLine2 + SCompilerTwoBraces;
  SCompilerConstCannotUse = '此处不能使用常量 "%s"';
  SCompilerBadEnvConst = '无效的环境常量 "%s"';
  SCompilerBadRegConst = '无效的注册表常量 "%s"';
  SCompilerBadIniConst = '无效的 INI 常量 "%s"';
  SCompilerBadParamConst = '无效的命令行参数常量 "%s"';
  SCompilerBadCodeConst = '无效的代码常量 "%s"';
  SCompilerBadDriveConst = '无效的驱动器常量 "%s"';
  SCompilerBadCustomMessageConst = '无效的自定义消息常量 "%s"';
  SCompilerBadBoolConst = '无效的布尔常量 "%s"';
  SCompilerConstantRenamed = '常量 "%s" 已重命名。请改用 "%s"。';
  SCompilerCommonConstantRenamed = '常量 "%s" 已重命名。请改用 "%s" 或考虑使用其 "auto" 形式。';

  { Special warnings }
  SCompilerMissingRunOnceIdsWarning = 'There are [%s] section entries without a %s parameter. '+
    'By assigning a string to %1:s, you can ensure that a particular [%0:s] entry will only be executed once during uninstallation. ' +
    'See the "[%0:s]" topic in help file for more information.';
  SCompilerUsedUserAreasWarning = 'The [%s] section directive "%s" is set to "%s" but per-user areas (%s) are used by the script. ' +
    'Regardless of the version of Windows, if the installation is running in administrative install mode then you should be careful about making any per-user area changes: such changes may not achieve what you are intending. ' +
    'See the "UsedUserAreasWarning" topic in help file for more information.';
  SCompilerOnlyBelowVersionParameterNTTooLowWarning = 'Minimum version specified by the OnlyBelowVersion parameter of an entry should be higher than %s if not 0 otherwise the entry is never processed. The entry should probably be removed. (Windows Vista/Server 2008 are no longer supported.)';

  { Directive parsing }
  SCompilerDirectiveNameMissing = 'Missing directive name';
  SCompilerDirectiveHasNoValue = 'Directive "%s" has no value';

  { Parameter parsing }
  SCompilerParamHasNoValue = '指定的参数 "%s" 没有值';
  SCompilerParamQuoteError = '参数 "%s" 的引号不匹配或位置错误';
  SCompilerParamMissingClosingQuote = '参数 "%s" 缺少右引号';
  SCompilerParamDataTooLong = '参数 "%s" 的数据过长';
  SCompilerParamUnknownParam = '无法识别的参数名称 "%s"';
  SCompilerParamDuplicated = '不能有多个 "%s" 参数';
  SCompilerParamConflict = '不能同时使用 "%s" 和 "%s" 参数';
  SCompilerParamEmpty2 = '参数 "%s" 为空';
  SCompilerParamNotSpecified = '未指定必需的参数 "%s"';
  SCompilerParamNoQuotes2 = '参数 "%s" 不能包含引号（"）';
  SCompilerParamNoBackslash = '参数 "%s" 不能包含反斜杠（\）';
  SCompilerParamNoPrecedingBackslash = '参数 "%s" 不能以反斜杠（\）开头';
  SCompilerParamInvalid2 = '参数 "%s" 不是有效值';
  SCompilerParamInvalidWithError = '参数 "%s" 不是有效值：%s';

  { Flags }
  SCompilerParamUnknownFlag2 = '参数 "%s" 包含未知标志';
  SCompilerParamErrorBadCombo2 = '参数 "%s" 不能同时使用 "%s" 和 "%s" 标志';
  SCompilerParamErrorBadCombo2SameSource = '参数 "%s" 不能在单个源文件上同时使用 "%s" 和 "%s" 标志';
  SCompilerParamUnsupportedFlag = '参数 "%s" 包含此节不支持的标志';
  SCompilerParamFlagMissing = '如果使用了 "%s" 标志，则必须使用 "%s" 标志';
  SCompilerParamFlagMissing2 = '如果使用了 "%s" 参数，则必须使用 "%s" 标志';
  SCompilerParamFlagMissing3 = '如果同时使用了 "%s" 和 "%s" 标志，则必须使用 "%s" 标志';
  SCompilerParamFlagMissingParam = '如果使用了 "%s" 标志，则必须指定 "%s" 参数';

  { Types, components, tasks, check, beforeinstall, afterinstall }
  SCompilerParamUnknownType = '参数 "%s" 包含未知类型';
  SCompilerParamUnknownComponent = '参数 "%s" 包含未知组件';
  SCompilerParamUnknownTask = '参数 "%s" 包含未知任务';
  SCompilerExpressionError = '指令或参数 "%s" 表达式错误：%s';
  SCompilerBadCheckOrInstall = '无效的 Check、BeforeInstall 或 AfterInstall 参数 "%s"';

  { Permissions }
  SCompilerPermissionsInvalidValue = '参数 "Permissions" 包含格式错误的值："%s"';
  SCompilerPermissionsUnknownSid = '参数 "Permissions" 包含未知的 SID："%s"';
  SCompilerPermissionsUnknownMask = '参数 "Permissions" 包含未知的访问类型："%s"';
  SCompilerPermissionsValueLimitExceeded = '参数 "Permissions" 不能包含超过 %d 个值';
  SCompilerPermissionsTooMany = '唯一 "Permissions" 参数值太多';

  { [Code] }
  SCompilerCodeUnsupportedEventFunction = '不再支持名为 "%s" 的事件函数。请改为创建 "%s" 函数';
  SCompilerCodeFunctionRenamed = '支持函数 "%s" 已重命名。请改用 "%s"。';
  SCompilerCodeFunctionRenamedWithAlternative = '支持函数 "%s" 已重命名。请改用 "%s" 或考虑使用 "%s"。';
  SCompilerCodeFunctionDeprecatedWithHint = '支持函数 "%s" 已弃用。请改用 "%s"。%s';
  SCompilerCodeFunctionExtractArchiveHint = '它包含一个可选的密码参数。';
  SCompilerCodeFunctionDeprecatedWithAlternativeAndDocs = '支持函数 "%s" 已弃用。请改用 "%s"，但请注意，在大多数情况下首选 "%s"。有关详细信息，请参阅帮助文件中的"%s"主题。';

  { [Types] }
  SCompilerTypesCustomTypeAlreadyDefined = '已定义自定义类型';

  { [Components], [Tasks], [Languages], [ISSigKeys] }
  SCompilerComponentsOrTasksBadName = '参数 "Name" 包含无效字符。' + SNewLine2 +
    '它只能包含字母数字字符、下划线、斜杠（/）和/或反斜杠（\），不能以数字开头，也不能以斜杠或反斜杠开头或结尾。名称 ''not''、''and'' 和 ''or'' 是保留的';
  SCompilerComponentsInvalidLevel = '组件不能低于前一个组件超过一级，或已达到最大级别数';
  SCompilerTasksInvalidLevel = '任务不能低于前一个任务超过一级，或已达到最大级别数';
  SCompilerLanguagesOrISSigKeysBadName = '参数 "%s" 包含无效字符。' + SNewLine2 + '它只能包含字母数字字符和/或下划线，且不能以数字开头。名称 ''not''、''and'' 和 ''or'' 是保留的';
  SCompilerLanguagesOrISSigKeysBadGroupName = '参数 "%s" 包含无效字符的名称。' + SNewLine2 + '名称只能包含字母数字字符和/或下划线，且不能以数字开头。名称 ''not''、''and'' 和 ''or'' 是保留的';
  SCompilerISSigKeysNameOrRuntimeIDExists = '%s "%s" 已在使用中';
  SCompilerISSigKeysKeyNotSpecified = '未指定必需的参数 "KeyFile" 或 "PublicX"/"PublicY"';
  SCompilerISSigKeysBadKeyID = '对于给定的 "KeyFile" 或 "PublicX"/"PublicY" 值，参数 "KeyID" 的值无效。';
  SCompilerISSigKeysBadKeyFile = '密钥文件格式错误';
  SCompilerISSigKeysUnknownKeyImportResult = '未知的导入密钥结果';

  { [Languages] }
  SCompilerParamUnknownLanguage = '参数 "%s" 包含未知语言';

  { [Messages] }
  SCompilerMessagesMissingEquals = '消息名称和文本之间缺少 "=" 分隔符';
  SCompilerMessagesNotRecognizedDefault = '此版本的 Inno Setup 无法识别 Default.isl 中的消息名称 "%s"';
  SCompilerMessagesNotRecognizedWarning = '此版本的 Inno Setup 无法识别消息名称 "%s"。忽略。';
  SCompilerMessagesNotRecognizedInFileWarning = '此版本的 Inno Setup 无法识别 "%s" 中的消息名称 "%s"。忽略。';
  SCompilerMessagesMissingDefaultMessage = 'Default.isl 中未定义名为 "%s" 的消息。此版本的 Inno Setup 需要该消息';
  SCompilerMessagesMissingMessageWarning = '未为 "%s" 语言定义名为 "%s" 的消息。将使用 Default.isl 中的英文消息。';

  { [CustomMessages] }
  SCompilerCustomMessageBadName = '自定义消息名称只能包含字母数字字符和/或下划线，且不能以数字开头';
  SCompilerCustomMessagesMissingLangWarning = '未为 "%s" 语言定义自定义消息 "%s"。将使用首次定义该消息的语言中的自定义消息："%s"。';
  SCompilerCustomMessagesMissingName = '未定义名为 "%s" 的自定义消息';

  { [Messages] & [LangOptions] }
  SCompilerUnknownLanguage = '未知的语言名称 "%s"';
  SCompilerCantSpecifyLanguage = '不能在消息文件中指定语言名称';
  SCompilerCantSpecifyLangOption = '语言选项 "%s" 不能应用于所有语言';

  { [Files] }
  SCompilerFilesTmpBadFlag = '对于复制到 {tmp} 目录的文件，或当使用 "deleteafterinstall" 或 ' +
    '"dontcopy" 标志时，参数 "Flags" 不能包含 "%s" 标志';
  SCompilerFilesWildcardNotMatched = '未找到匹配 "%s" 的文件';
  SCompilerFilesDestNameCantBeSpecified = '如果 ' +
    '"Source" 参数包含通配符或使用了 "extractarchive" 标志但未使用 "download"，则不能指定 "DestName" 参数';
  SCompilerFilesParamRequiresFlag = '参数 "%s" 只能在使用 "%s" 标志时使用';
  SCompilerFilesParamFlagConflict = '当使用 "%s" 标志时，不能使用参数 "%s"';
  SCompilerFilesParamFlagConflictSameSource = '参数 "%s" 和 "%s" 标志不能在单个源文件上同时使用';
  SCompilerFilesExcludeTooLong = '参数 "Excludes" 包含的模式过长';
  SCompilerFilesUnsafeFile = '检测到不安全的文件：%s.' + SNewLine2 +
    '有关详细信息，请参阅帮助文件中的"不安全文件"主题';
  SCompilerFilesSystemDirUsed = '尝试从自己的 Windows 系统目录部署 DLL 文件。' + SNewLine2 +
    '有关为何这是危险的以及应该避免的更多信息，请参阅帮助文件中的"不安全文件"主题';
  SCompilerFilesSystemDirNotUsed = '尝试将已注册的文件 %s 部署到 {sys} 以外的位置。' + SNewLine2 +
    '有关为何这是危险的以及应该避免的更多信息，请参阅帮助文件中的"不安全文件"主题';
  SCompilerFilesIgnoreVersionUsedUnsafely =
    '文件 "%s" 上使用了不安全的标志：不应在 ' +
    '安装到 Windows 系统目录（"{sys}"）的文件上使用 "ignoreversion" 标志。';
  SCompilerFilesWarningCopyMode = '"CopyMode: %s" 在 ' +
    '此版本的 Inno Setup 中已被 "Flags: %s" 取代。行为如同指定了 "Flags: %s"。';
  SCompilerFilesWarningASISOO = '"CopyMode: alwaysskipifsameorolder" 已弃用，并在 ' +
    '此版本的 Inno Setup 中被忽略。这现在是默认行为。';
  SCompilerFilesWarningSharedFileSysWow64 = '当使用 "sharedfile" 标志时，DestDir 不应设置为 ' +
    '"{syswow64}"。有关详细信息，请参阅帮助文件中的 "sharedfile" 文档。';
  SCompilerFilesISSigVerifyMissingISSigKeys = '当 "ISSigKeys" 节不存在或为空时，不能使用 "issigverify" 标志。';
  SCompilerFilesISSigAllowedKeysMissingISSigVerify = '当使用 "ISSigAllowedKeys" 参数时，必须使用 "issigverify" 标志。';
  SCompilerFilesValueConflict = '参数 "%s" 不能允许在同一源文件上使用不同的值';
  SCompilerFilesUnknownISSigKeyNameOrGroupName = '参数 "%s" 包含未知名称或组名称。';

  { [Icons] }
  SCompilerIconsNamePathNotSpecified = '参数 "Name" 必须包含图标的路径，' +
    '例如，"{group}\My Icon"';
  SCompilerIconsIconIndexInvalid = '参数 "IconIndex" 不是有效的整数';

  { [Registry] }
  SCompilerRegistryDeleteKeyProhibited = '在指定的键上禁止使用 "uninsdeletekey" 和 ' +
    '"deletekey" 标志，因为结果将是灾难性的。（您可能指的是删除值。）';

  { [Run] }
  SCompilerRunCantUseRunOnceId = '参数 "RunOnceId" 只能在 ' +
    '[UninstallRun] 节中使用';
  SCompilerRunFlagObsolete = '标志 "%s" 已过时。请改用 "%s"。';
  SCompilerRunMultipleWaitFlags = '参数 "Flags" 不能包含多个 "wait" 标志';

  { [UninstallRun] }
  SCompilerUninstallRunCantUseDescription = '参数 "Description" 只能在 ' +
    '[Run] 节中使用';

implementation

end.
