<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
  String today = formatter.format(new java.util.Date());
  String file_name = "dlvr"+today;
  String ExcelName 	= new String(file_name.getBytes(),"UTF-8")+".xls";
  response.setContentType("application/vnd.ms-excel");
  response.setHeader("Content-Disposition", "attachment; filename="+ExcelName);
  response.setHeader("Content-Description", "JSP Generated Data");
  response.setHeader("Pragma", "no-cache");
%>
<html>
<head>
  <meta http-equiv=Content-Type content="text/html; charset=utf-8">
  <meta name=ProgId content=Excel.Sheet>
  <meta name=Generator content="Microsoft Excel 15">
  <style id="test_105_Styles">
    <!--table
    {mso-displayed-decimal-separator:"\.";
      mso-displayed-thousand-separator:"\,";}
    @page
    {margin:.75in .7in .75in .7in;
      mso-header-margin:.3in;
      mso-footer-margin:.3in;}
    .font5
    {color:windowtext;
      font-size:8.0pt;
      font-weight:400;
      font-style:normal;
      text-decoration:none;
      font-family:"맑은 고딕";
      mso-generic-font-family:auto;
      mso-font-charset:129;}
    tr
    {mso-height-source:auto;
      mso-ruby-visibility:none;}
    col
    {mso-width-source:auto;
      mso-ruby-visibility:none;}
    br
    {mso-data-placement:same-cell;}
    .style17
    {mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
      mso-style-name:"쉼표 \[0\]";
      mso-style-id:6;}
    .style0
    {mso-number-format:General;
      text-align:general;
      vertical-align:middle;
      white-space:nowrap;
      mso-rotate:0;
      mso-background-source:auto;
      mso-pattern:auto;
      color:black;
      font-size:12.0pt;
      font-weight:400;
      font-style:normal;
      text-decoration:none;
      font-family:"맑은 고딕";
      mso-generic-font-family:auto;
      mso-font-charset:129;
      border:none;
      mso-protection:locked visible;
      mso-style-name:표준;
      mso-style-id:0;}
    td
    {mso-style-parent:style0;
      padding-top:1px;
      padding-right:1px;
      padding-left:1px;
      mso-ignore:padding;
      color:black;
      font-size:12.0pt;
      font-weight:400;
      font-style:normal;
      text-decoration:none;
      font-family:"맑은 고딕";
      mso-generic-font-family:auto;
      mso-font-charset:129;
      mso-number-format:General;
      text-align:general;
      vertical-align:middle;
      border:none;
      mso-background-source:auto;
      mso-pattern:auto;
      mso-protection:locked visible;
      white-space:nowrap;
      mso-rotate:0;}
    .xl63
    {mso-style-parent:style0;
      font-size:14.0pt;
      font-weight:700;
      text-align:center;
      vertical-align:top;
      border-top:none;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:none;}
    .xl64
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:2.0pt double windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:none;
      border-left:2.0pt double windowtext;}
    .xl65
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:2.0pt double windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:none;
      border-left:.5pt hairline windowtext;}
    .xl66
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:2.0pt double windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:none;
      border-left:2.0pt double windowtext;}
    .xl67
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:2.0pt double windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:none;
      border-left:.5pt hairline windowtext;}
    .xl68
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:2.0pt double windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:none;
      border-left:.5pt hairline windowtext;
      white-space:normal;}
    .xl69
    {mso-style-parent:style0;
      font-size:9.0pt;
      mso-number-format:"Long Date";
      text-align:center;
      border-top:2.0pt double windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:none;
      border-left:.5pt hairline windowtext;}
    .xl70
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:2.0pt double windowtext;}
    .xl71
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    .xl72
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:none;
      border-left:2.0pt double windowtext;}
    .xl73
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:none;
      border-left:.5pt hairline windowtext;}
    .xl74
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:none;
      border-left:.5pt hairline windowtext;}
    .xl75
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:none;
      border-left:2.0pt double windowtext;}
    .xl76
    {mso-style-parent:style0;
      font-size:9.0pt;
      mso-number-format:"Long Date";
      text-align:center;
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:none;
      border-left:.5pt hairline windowtext;
      white-space:normal;}
    .xl77
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:2.0pt double windowtext;}
    .xl78
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    .xl79
    {mso-style-parent:style0;
      font-size:9.0pt;
      mso-number-format:"Long Date";
      text-align:center;
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    .xl80
    {mso-style-parent:style17;
      font-size:9.0pt;
      font-weight:700;
      border-top:2.0pt double windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:none;
      border-left:2.0pt double windowtext;}
    .xl81
    {mso-style-parent:style17;
      font-size:9.0pt;
      mso-number-format:"\#\,\#\#0_ ";
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl82
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:2.0pt double windowtext;
      border-right:none;
      border-bottom:none;
      border-left:.5pt hairline windowtext;
      white-space:normal;}
    .xl83
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:2.0pt double windowtext;
      border-right:none;
      border-bottom:none;
      border-left:none;
      white-space:normal;}
    .xl84
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:2.0pt double windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:none;
      border-left:none;
      white-space:normal;}
    .xl85
    {mso-style-parent:style17;
      font-size:9.0pt;
      font-weight:700;
      border-top:.5pt hairline windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt solid windowtext;
      border-left:2.0pt double windowtext;}
    .xl86
    {mso-style-parent:style17;
      font-size:9.0pt;
      mso-number-format:"\#\,\#\#0_ ";
      border-top:.5pt hairline windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:.5pt solid windowtext;
      border-left:.5pt hairline windowtext;}
    .xl87
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:none;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    .xl88
    {mso-style-parent:style0;
      border-top:none;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:none;}
    .xl89
    {mso-style-parent:style0;
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:none;}
    .xl90
    {mso-style-parent:style17;
      font-size:9.0pt;
      font-weight:700;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:2.0pt double windowtext;}
    .xl91
    {mso-style-parent:style17;
      font-size:9.0pt;
      mso-number-format:"\#\,\#\#0_ ";
      border-top:.5pt solid windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    .xl92
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:2.0pt double windowtext;
      border-right:none;
      border-bottom:none;
      border-left:2.0pt double windowtext;}
    .xl93
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:2.0pt double windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:none;
      border-left:none;}
    .xl94
    {mso-style-parent:style17;
      color:white;
      font-size:9.0pt;
      font-weight:700;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:2.0pt double windowtext;}
    .xl95
    {mso-style-parent:style17;
      font-size:9.0pt;
      mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
      text-align:right;
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    .xl96
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:none;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:2.0pt double windowtext;}
    .xl97
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:none;}
    .xl98
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:none;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;
      white-space:normal;}
    .xl99
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:none;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:none;
      white-space:normal;}
    .xl100
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:left;
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:none;
      white-space:normal;}
    .xl101
    {mso-style-parent:style17;
      font-size:9.0pt;
      font-weight:700;
      border-top:2.0pt double windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:2.0pt double windowtext;}
    .xl102
    {mso-style-parent:style17;
      font-size:9.0pt;
      font-weight:700;
      border-top:2.0pt double windowtext;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:none;}
    .xl103
    {mso-style-parent:style0;
      font-size:9.0pt;
      text-align:center;
      border-top:2.0pt double windowtext;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:none;}
    .xl104
    {mso-style-parent:style0;
      font-size:9.0pt;
      border-top:2.0pt double windowtext;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:none;}
    .xl105
    {mso-style-parent:style0;
      font-size:9.0pt;
      border-top:2.0pt double windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:none;}
    .xl106
    {mso-style-parent:style0;
      font-size:9.0pt;
      font-weight:700;
      text-align:center;
      border-top:2.0pt double windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt solid windowtext;
      border-left:2.0pt double windowtext;}
    .xl107
    {mso-style-parent:style0;
      font-size:9.0pt;
      font-weight:700;
      text-align:center;
      border-top:2.0pt double windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt solid windowtext;
      border-left:.5pt hairline windowtext;}
    .xl108
    {mso-style-parent:style0;
      font-size:9.0pt;
      font-weight:700;
      text-align:center;
      border-top:2.0pt double windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:.5pt solid windowtext;
      border-left:.5pt hairline windowtext;}
    .xl109
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:2.0pt double windowtext;}
    .xl110
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl111
    {mso-style-parent:style0;
      font-size:9.0pt;
      text-align:center;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl112
    {mso-style-parent:style0;
      font-size:9.0pt;
      text-align:center;
      border:.5pt hairline windowtext;}
    .xl113
    {mso-style-parent:style17;
      font-size:9.0pt;
      mso-number-format:"Short Date";
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl114
    {mso-style-parent:style0;
      color:black;
      font-size:9.0pt;
      border:.5pt hairline windowtext;}
    .xl115
    {mso-style-parent:style17;
      font-size:9.0pt;
      font-weight:700;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:2.0pt double windowtext;}
    .xl116
    {mso-style-parent:style17;
      font-size:9.0pt;
      font-weight:700;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl117
    {mso-style-parent:style0;
      font-size:9.0pt;
      font-weight:700;
      text-align:center;
      border:.5pt hairline windowtext;}
    .xl118
    {mso-style-parent:style17;
      font-size:9.0pt;
      font-weight:700;
      mso-number-format:"\#\,\#\#0_ ";
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl119
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl120
    {mso-style-parent:style17;
      color:red;
      font-size:9.0pt;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:2.0pt double windowtext;}
    .xl121
    {mso-style-parent:style17;
      color:red;
      font-size:9.0pt;
      font-weight:700;
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl122
    {mso-style-parent:style0;
      color:red;
      font-size:9.0pt;
      text-align:center;
      border:.5pt hairline windowtext;}
    .xl123
    {mso-style-parent:style17;
      color:red;
      font-size:9.0pt;
      mso-number-format:"\#\,\#\#0_ ";
      border-top:none;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl124
    {mso-style-parent:style17;
      color:red;
      font-size:9.0pt;
      mso-number-format:"Short Date";
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl125
    {mso-style-parent:style0;
      font-size:9.0pt;
      border-top:.5pt solid windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:2.0pt double windowtext;}
    .xl126
    {mso-style-parent:style0;
      font-size:9.0pt;
      font-weight:700;
      text-align:center;
      border-top:.5pt solid windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    .xl127
    {mso-style-parent:style0;
      font-size:9.0pt;
      font-weight:700;
      border-top:.5pt solid windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    .xl128
    {mso-style-parent:style17;
      font-size:9.0pt;
      mso-number-format:"\#\,\#\#0_ ";
      border-top:.5pt solid windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    .xl129
    {mso-style-parent:style0;
      font-size:9.0pt;
      border-top:.5pt solid windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    .xl130
    {mso-style-parent:style17;
      font-size:9.0pt;
      font-weight:700;
      border-top:2.0pt double windowtext;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:2.0pt double windowtext;}
    .xl131
    {mso-style-parent:style0;
      font-size:9.0pt;
      font-weight:700;
      text-align:center;
      border-top:2.0pt double windowtext;
      border-right:none;
      border-bottom:2.0pt double windowtext;
      border-left:none;}
    .xl132
    {mso-style-parent:style0;
      font-size:9.0pt;
      font-weight:700;
      text-align:center;
      border-top:2.0pt double windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:none;}
    .xl133
    {mso-style-parent:style17;
      font-size:9.0pt;
      border-top:.5pt hairline windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:2.0pt double windowtext;}
    .xl134
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:right;
      border-top:none;
      border-right:2.0pt double windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl135
    {mso-style-parent:style17;
      font-size:9.0pt;
      border:.5pt hairline windowtext;}
    .xl136
    {mso-style-parent:style17;
      font-size:9.0pt;
      mso-number-format:"\#\,\#\#0_ ";
      border:.5pt hairline windowtext;}
    .xl137
    {mso-style-parent:style17;
      font-size:9.0pt;
      text-align:right;
      border-top:.5pt hairline windowtext;
      border-right:2.0pt double windowtext;
      border-bottom:.5pt hairline windowtext;
      border-left:.5pt hairline windowtext;}
    .xl138
    {mso-style-parent:style0;
      font-size:9.0pt;
      font-weight:700;
      mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
      border-top:.5pt solid windowtext;
      border-right:.5pt hairline windowtext;
      border-bottom:2.0pt double windowtext;
      border-left:.5pt hairline windowtext;}
    ruby
    {ruby-align:left;}
    rt
    {color:windowtext;
      font-size:8.0pt;
      font-weight:400;
      font-style:normal;
      text-decoration:none;
      font-family:"맑은 고딕";
      mso-generic-font-family:auto;
      mso-font-charset:129;
      mso-char-type:none;
      display:none;}
    -->
  </style>
</head>

<body link="#0563C1" vlink="#954F72">
  <table border="0" cellpadding="0" cellspacing="0" width="904" style="border-collapse:collapse;table-layout:fixed;">
    <colgroup>
      <col width="75" style="mso-width-source:userset;mso-width-alt:5589;width:75px;" />
      <col width="75" style="mso-width-source:userset;mso-width-alt:5248;width:75px;" />
      <col width="53" span="2" style="mso-width-source:userset;mso-width-alt:1706;width:53px;" />
      <col width="30" span="2" style="mso-width-source:userset;mso-width-alt:4650;width:30px;" />
      <col width="30" span="2" style="mso-width-source:userset;mso-width-alt:4650;width:30px;" />
      <col width="75" style="mso-width-source:userset;mso-width-alt:5418;width:75px;" />
      <col width="75" style="mso-width-source:userset;mso-width-alt:5418;width:75px;" />
    </colgroup>
  <tbody>
    <tr height=28 style='height:21.0pt'>
      <td colspan=7 height=28 class=xl63 style='height:21.0pt;'>M A S 표 준 계 약 서<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
    </tr>
    <tr height=41 style='height:31.0pt'>
      <td height=41 class=xl64 style='height:31.0pt;border-top:none'>계약업체<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl65 style='border-top:none;border-left:none;width:50px;'><ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td colspan=2 class=xl66 style='border-left:none;'>
  요처<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl68 width=100 style='border-top:none;border-left:none;width:75pt'>${projectInfo.cAgency}<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl64 style='border-top:none;border-left:none'>계약일<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl69 style='border-top:none;border-left:none'></td>
    </tr>
    <tr height=25 style='height:19.0pt'>
      <td height=25 class=xl70 style='height:19.0pt'>담당/연락처<ruby><font class="font5"><rtclass=font5></rt></font></ruby></td>
      <td class=xl71 style='border-left:none'>　</td>
      <td colspan=2 class=xl72 style='border-left:none'>담당자<ruby><font class="font5"><rtclass=font5></rt></font></ruby></td>
      <td class=xl74 style='border-left:none'>${projectInfo.hName}</td>
      <td class=xl75 style='border-left:none'>납품기한(준공일)<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl76 width=100 style='border-left:none;width:75pt'></td>
    </tr>
    <tr height=27 style='height:20.0pt'>
      <td height=27 class=xl70 style='height:20.0pt'>송신조달청<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl71 style='border-left:none'>
        <ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td colspan=2 class=xl77 style='border-left:none'>연락처<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl71 style='border-left:none'><span style='mso-spacerun:yes'> </span>032-509-6185<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl70 style='border-left:none'>발주일<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl79 style='border-left:none'>　</td>
    </tr>
    <tr height=25 style='height:19.0pt'>
      <td height=25 class=xl80 style='height:19.0pt;border-top:none'>계약금액(KEVIC)<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl81 align=right style='border-left:none'> </td>
      <td colspan=2 class=xl72>배송방법/주소<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td colspan=3 class=xl82 width=225 style='border-right:2.0pt double black; border-left:none;width:225pt'>　</td>
    </tr>
    <tr height=25 style='height:19.0pt'>
      <td height=25 class=xl85 style='height:19.0pt'>타사금액(타사장<span style='display:none'>비)</span><ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl86 align=right style='border-top:none;border-left:none'>
      </td>
      <td colspan=2 class=xl77 style='border-left:none'>수령인/연락처<ruby><font
              class="font5"><rt class=font5></rt></font></ruby></td>
      <td colspan=3 class=xl87 style='border-right:2.0pt double black;border-left:none'>　</td>
    </tr>
    <tr height=27 style='height:20.0pt'>
      <td height=27 class=xl90 style='height:20.0pt'>총계약금액<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl91 align=right style='border-top:none;border-left:none'><fmt:formatNumber type="currency" value="${projectInfo.gdPrice}" /></td>
      <td colspan=2 rowspan=2 class=xl92 style='border-right:.5pt hairline black; border-bottom:2.0pt double black'>기타 특이사항<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td colspan=3 rowspan=2 class=xl82 width=225 style='border-right:2.0pt double black; border-bottom:2.0pt double black;width:225pt'>
        <ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
    </tr>
  <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl101 style='height:20.0pt;border-top:none'></td>
  <td class=xl102 style='border-left:none'></td>
</tr>
    <tr height=27 style='height:20.0pt'>
      <td height=27 class=xl101 style='height:20.0pt;border-top:none'>건<span style='mso-spacerun:yes'>   </span>명<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl102 colspan=6 style='border-left:none;border-right:2.0pt double black'>${projectInfo.ctName}<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
    </tr>
    <tr height=25 style='height:19.0pt'>
      <td height=25 class=xl106 style='height:19.0pt;border-top:none' colspan=2>품<span style='mso-spacerun:yes'>  </span>명<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl107 style='border-top:none;border-left:none'>수량<ruby><font
              class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl107 style='border-top:none;border-left:none'>단위<ruby><font
              class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl107 style='border-top:none;border-left:none'>계약단가<ruby><font
              class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl107 style='border-top:none;border-left:none'>계약금액<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl108 style='border-top:none;border-left:none'>비<span style='mso-spacerun:yes'>  </span>고<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
    </tr>
<c:set var="qty_sum" value="0" />
<c:set var="price_sum" value="0" />
    <c:forEach var="listview" items="${prdlist}" varStatus="status">

      <tr height=24 style='height:18.0pt'>
        <td height=24 class=xl109 style='height:18.0pt'>${fn:split(listview.prdctIdntNoNm,',')[0]}</td>
        <td height=24 class=xl111 style='height:18.0pt'>${fn:split(listview.prdctIdntNoNm,',')[2]}</td>
        <td class=xl111 style='border-left:none'>${listview.prdctQty}</td>
        <td class=xl112 style='border-left:none'>${listview.prdctUnit}</td>
        <td class=xl81 align=right style='border-left:none'><fmt:formatNumber type="currency" value="${listview.prdctUprc}" /></td>
        <td class=xl81 align=right style='border-left:none'><fmt:formatNumber type="currency" value="${listview.incdecAmt}" /> </td>
        <td class=xl113 style='border-left:none'></td>
      </tr>
      <c:set var="qty_sum" value="${qty_sum + listview.prdctQty}" />
      <c:set var="price_sum" value="${price_sum + listview.incdecAmt}" />
    </c:forEach>
<c:forEach var="i" begin="0" end="4">
  <tr height=24 style='height:18.0pt'>
    <td height=24 class=xl109 style='height:18.0pt'></td>
    <td height=24 class=xl111 style='height:18.0pt'></td>
    <td class=xl111 style='border-left:none'></td>
    <td class=xl112 style='border-left:none'></td>
    <td class=xl81 align=right style='border-left:none'></td>
    <td class=xl81 align=right style='border-left:none'> </td>
    <td class=xl113 style='border-left:none'></td>
  </tr>
</c:forEach>
    <tr height=25 style='height:19.0pt'>
      <td height=25 class=xl125 style='height:19.0pt' colspan=2>합<span style='mso-spacerun:yes'> </span>계<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
      <td class=xl126 style='border-left:none'><fmt:formatNumber type="currency" value="${qty_sum}" /></td>
      <td class=xl126 style='border-left:none'>　</td>
      <td class=xl127 style='border-left:none'>　</td>
      <td class=xl138 style='border-left:none'><span
              style='mso-spacerun:yes'>         </span><fmt:formatNumber type="currency" value="${price_sum}" /></td>
      <td class=xl129 style='border-left:none'>　</td>
    </tr>

    </tbody>
  </table>
<table>
  <tr><td></td></tr>
</table>
</body>
</html>
