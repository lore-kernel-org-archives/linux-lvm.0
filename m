References: <D1D4AF7B-074F-4F13-9A23-23694F162675@globalnoc.iu.edu>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <cce747c5-8f09-ec87-f9ca-ae3b4c94ac56@redhat.com>
Date: Fri, 5 Jul 2019 00:45:49 +0200
MIME-Version: 1.0
In-Reply-To: <D1D4AF7B-074F-4F13-9A23-23694F162675@globalnoc.iu.edu>
Content-Type: multipart/alternative;
	boundary="------------F15A7C66C50E94A22C0CC535"
Content-Language: en-MW
Subject: Re: [linux-lvm] Lvm RAID0 vs lvm striping
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>, John Ratliff <jdratlif@globalnoc.iu.edu>

This is a multi-part message in MIME format.
--------------F15A7C66C50E94A22C0CC535
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

This is both striping via 2 different, supported device-mapper targets, 
'striped' and 'raid'
('striped' is  an older, separate target and  'raid0' is supported by 
the 'raid' target which
  also supports raid1/raid4/raid5/raid6 and raid10).

The algorithm to distribute data on the stripes is the same for both 
striped and raid0
and they can be converted into each other running 'lvconvert --type 
striped|raid0 $LV'
since raid target version 1.7.0 / lvm2 version 2.02.155.

See lvmraid(7) for insight into the RAID support in lvm including the 
aforementioned
and many more conversions from and to RAID and between RAID levels and 
layouts..

Heinz

On 7/2/19 5:53 PM, John Ratliff wrote:
>
> What is the difference between these two?
>
> Thanks.
>
> John Ratliff
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------F15A7C66C50E94A22C0CC535
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>This is both striping via 2 different, supported device-mapper
      targets, 'striped' and 'raid'<br>
      ('striped' is  an older, separate target and  'raid0' is supported
      by the 'raid' target which<br>
       also supports raid1/raid4/raid5/raid6 and raid10).<br>
    </p>
    <p>The algorithm to distribute data on the stripes is the same for
      both striped and raid0<br>
      and they can be converted into each other running 'lvconvert
      --type striped|raid0 $LV'<br>
      since raid target version 1.7.0 / lvm2 version 2.02.155.</p>
    <p>See lvmraid(7) for insight into the RAID support in lvm including
      the aforementioned<br>
      and many more conversions from and to RAID and between RAID levels
      and layouts..<br>
    </p>
    <p>Heinz<br>
    </p>
    <div class="moz-cite-prefix">On 7/2/19 5:53 PM, John Ratliff wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:D1D4AF7B-074F-4F13-9A23-23694F162675@globalnoc.iu.edu">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt">What is the
            difference between these two?<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">Thanks.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">John Ratliff</span><o:p></o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F15A7C66C50E94A22C0CC535--
