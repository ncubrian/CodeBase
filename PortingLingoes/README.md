Porting Lingoes to Mac 10.11.3
===
1. 下载并安装XQuartz和wine 4.0
https://www.winehq.org/
* 勾选64bit support
2. 下载Lingoes
http://www.lingoes.cn/zh/translator/download.htm
双击执行安装程序
安装目录在`/Users/admin/.wine/drive_c/users/admin/Local\ Settings/Application\ Data/Lingoes/Translator/lingoes-cn`
3. 执行Lingoes64.exe
提示缺少的组件执行自动下载并安装(如果网络不好下载困难，就要手动下载下来并安装)
* .NET 4.5需要手动下载并安装
4. 手动添加字典
在`/Users/admin/.wine/drive_c/users/admin/Local\ Settings/Application\ Data/Lingoes/Translator/user_data/dict/dictcfg.xml` 文件中按照如下方式添加字典

```
<?xml version="1.0" encoding="UTF-16" ?>
<config>
<install>
  <dict src="Concise English Synonym and Antonym Dictionary_25D62D261B9B6943BE86B7DCF8F9D255.ldx" id="25D62D261B9B6943BE86B7DCF8F9D255" ver="2.6" />
  <dict src="now2_74BF7ECCE3A9AC43B5E8902261A19B29.ldx" id="74BF7ECCE3A9AC43B5E8902261A19B29" ver="2.7" />
  <dict src="Jukuu Bilingual Sentence Searcher_D04CA8D7791B794AAFC895D54BC07DC8.ldx" id="D04CA8D7791B794AAFC895D54BC07DC8" ver="2.7" />
  <dict src="instant_93A93E37CB43D14DB05A15ECCCE91634.ldx" id="93A93E37CB43D14DB05A15ECCCE91634" ver="2.7" sys="y" />
  <dict src="now4_54BDECB4CEEAB74D9F8BED8AF043163D.ldx" id="54BDECB4CEEAB74D9F8BED8AF043163D" ver="2.7" sys="y" />
  <dict src="Vicon Chinese(S)-English Dictionary_0D9A782C04A3704F8668D0093676117B.ldx" id="0D9A782C04A3704F8668D0093676117B" ver="2.6" />
  <dict src="Vicon English-Chinese(S) Dictionary_E1C27E806399D047822B6650194A3D32.ldx" id="E1C27E806399D047822B6650194A3D32" ver="2.6" />
  <dict src="Longman+Dictionary+of+Contemporary+English_D4722835273E184582F2D24696A738EA.ldx" id="D4722835273E184582F2D24696A738EA" ver="2.4" />
  <dict src="Merriam-Webster+Collegiate+Dictionary_DD900E7D1A47994CB52F0BFC7C75D11E.ldx" id="DD900E7D1A47994CB52F0BFC7C75D11E" ver="2.2" />
  <dict src="Oxford+Advanced+Learner%27s+Dictionary_3253C2A669C4DB4F8508B5FC4A017DDE.ldx" id="3253C2A669C4DB4F8508B5FC4A017DDE" ver="2.0" />
</install>
<query_group>
  <dict id="E1C27E806399D047822B6650194A3D32" enable="y" minimize="n" />
  <dict id="0D9A782C04A3704F8668D0093676117B" enable="y" minimize="n" />
  <dict id="25D62D261B9B6943BE86B7DCF8F9D255" enable="y" minimize="n" />
  <dict id="74BF7ECCE3A9AC43B5E8902261A19B29" enable="y" minimize="n" />
  <dict id="D04CA8D7791B794AAFC895D54BC07DC8" enable="y" minimize="n" />
  <dict id="93A93E37CB43D14DB05A15ECCCE91634" enable="n" minimize="n" />
  <dict id="54BDECB4CEEAB74D9F8BED8AF043163D" enable="y" minimize="n" />
  <dict id="D4722835273E184582F2D24696A738EA" enable="y" minimize="n" />
  <dict id="DD900E7D1A47994CB52F0BFC7C75D11E" enable="y" minimize="n" />
  <dict id="3253C2A669C4DB4F8508B5FC4A017DDE" enable="y" minimize="n" />
</query_group>
<index_group>
  <dict id="E1C27E806399D047822B6650194A3D32" enable="y" minimize="n" />
  <dict id="0D9A782C04A3704F8668D0093676117B" enable="y" minimize="n" />
  <dict id="D4722835273E184582F2D24696A738EA" enable="y" minimize="n" />
  <dict id="DD900E7D1A47994CB52F0BFC7C75D11E" enable="y" minimize="n" />
  <dict id="3253C2A669C4DB4F8508B5FC4A017DDE" enable="y" minimize="n" />
</index_group>
<grab_group>
  <dict id="E1C27E806399D047822B6650194A3D32" enable="y" minimize="n" />
  <dict id="0D9A782C04A3704F8668D0093676117B" enable="y" minimize="n" />
  <dict id="74BF7ECCE3A9AC43B5E8902261A19B29" enable="y" minimize="n" />
  <dict id="93A93E37CB43D14DB05A15ECCCE91634" enable="y" minimize="n" />
</grab_group>
</config>
```
字典文件也放在此目录下。
```
Longman+Dictionary+of+Contemporary+English_D4722835273E184582F2D24696A738EA.ldx
Merriam-Webster+Collegiate+Dictionary_DD900E7D1A47994CB52F0BFC7C75D11E.ldx
Oxford+Advanced+Learner%27s+Dictionary_3253C2A669C4DB4F8508B5FC4A017DDE.ldx
```
