Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6PMYdu6006011
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2012 18:34:39 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6PMYcSZ006081
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2012 18:34:38 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.5/8.14.4/SuSE Linux 0.8) with ESMTP id
	q6PMYZfQ021992
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2012 15:34:37 -0700
Message-ID: <5010747B.10908@tlinx.org>
Date: Wed, 25 Jul 2012 15:34:35 -0700
From: Linda Walsh <lvm@tlinx.org>
MIME-Version: 1.0
References: <500C44EF.4080004@tlinx.org> <20120725210434.GA20135@redhat.com>
In-Reply-To: <20120725210434.GA20135@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------030303080700060704080401"
Subject: Re: [linux-lvm] RFE?  Really power of 2?  extents,
	chunks and raid alignment
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------030303080700060704080401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit





Mike Snitzer wrote:
>
>> I have 12 data disks in a RAID 50 (3 RAID5's in a RAID0) and use a suggested
>> stripesize of 64k, so a stripe-width of 768k.
>>     
I must state this correction -- to the above -- I was thinking I had to
use the least common multiplier -- but in reality, I _think_ (subject to
later revision, both -- reality and what I think, ;-)), I should be able to
use the greatest common denominator  and that should work
equally well.

Nevertheless, this:
>
> The DM update for the 3.6 merge window adds non power of 2 support in
> the kernel (for the stripe and thin-pool targets).
>
> So the lvm2 constraints that require a power of 2 chunksize will be
> relaxed very shortly.
>   
is great news, as I'm sure that being able to synchronize stripes to
chunksize AND extent size, would allow better performance for RAID aware
file systems...

I.e. As it is now, I need to have my extents line up, my chunks line up
AND my file system block allocations line up....*ouch*....

If any of those start at 'fixed offsets' from the beginnning of their
space and that fixed size isn't a multiple of the extent size (for VG's)
OR chunksize for LV's, then all of the VG's/LV's will won't line up --
this is only an issue if you have multiple VG's per PV (i.e. the PV's
will use the same physical disks, and the LV's would also use the same
disks, but what you thought was an aligned database mirrored in
1 partition might be completely non-aligned if anything under it is
    misaligned.

I very well do NOT know, the full impact of such -- only that it would
cause unpredictable or variable performance, which as an engineer,
bothers me.




--------------030303080700060704080401
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <style>
/* margin:(X):=T+B+R+L; (V H):V=T+B,H=R+L; (T H B):T,H=R+L, (T R B L) */
/*body { margin:.5cm .20cm;padding:.15cm .15cm;}*/
/* disable local font and span tags by default */
.l, body, .l   p, .l table, .l tbody{ 
	font: 14.3pt/100% Constantia, Verdana, "Lucida Bright",Serif;
	font-size-adjust:.44;
  background-color:#faf8ff; color:#105070;
	-moz-tab-size:3; -o-tab-size:3; tab-size:3;
}
p {  margin  .5cm; text-indent:.5cm;}
p+p { margin-top.20cm;margin-bottom:.20cm}
.l small { font-size:85.18%;}
.l big { font-size:117.4%;}
.generic-font-families {
    font-family:cursive,fantasy,sans-serif,serif,monospace;
}
.quoted { font-style:italic; font-size:90%;}
.l em { font-variant:small-caps }
.l h6 {font-size:78.615% } 
.l h5 {font-size:100%    } 
.l h4 {font-size:127.202%} 
.l h3 {font-size:161.803%} 
.l h2 {font-size:205.817%} 
.l h1 {font-size:261.803%}
.l h1,.l h2,.l h3,.l h4,.l h5 { font-size: inherit; font-weight:bold }
.l h5,.l h6 { font-size: inherit; font-variant:small-caps }
.l h5 {font: inherit; font-weight:800} 
.l h6 {font: inherit; font-weight:700}
.l h1,.l h2,.l h3,.l h4,.l h5,.l h6 { margin:.5em }
.l blockquote {margin:.5cm .9cm;}
.l blockquote .l p{ margin: .20cm .25cm;}
.l blockquote .l p, blockquote .l p+blockquote .l p { text-indent:-.35cm; }
.l blockquote .l p+blockquote .l p { margin-top:.15cm;margin-bottom:.15cm}
.l pre, .l cite {
  padding:1cm .9cm;
}
pre cite tt { font-style:oblique; background-color:#f0f4ff; color:#203040; 
	-moz-tab-size:3; -o-tab-size:3; tab-size:3;
	font-family:lucida console,monospace;}
.l pre+pre {
	font-inherit; font-style:oblique; background-color:#f0f4ff; color:#203040; 
	-moz-tab-size:3; -o-tab-size:3; tab-size:3;
	margin:1ex .9cm}
address {
  font inherit;	font-style:oblique; font-family:Cambria;
}
.l address { font:inherit; margin:1em 2cm; background-color:#f8faff; }
.l address+address{ margin:0 1.5cm}
.l img { margin:.8cm }
.l q:before {content:open-quote }
.l q:after {content:close-quote }
.l a, a:link,a:focus,a:visited { text-decoration:underline }
a:link { color:#44BB33 }
a:focus { color: #22FF11 }
a:visited {color: #557722 }
.sig {
	font oblique 3cm/1em  "Lucida Handwriting",cursive;
	text-indent:2cm;
	margin: 3cm 8cm;
}
.sig:first-letter {
	float:left;
	font: italic 3in/1em "Lucida Calligraphy",cursive;
	font-weight:200;
	margin: -3cm -4mm inherit inherit;
}
#sig_fl {
	float:left;
	font:italic 3in/1em "Lucida Calligraphy";
	font-weight:200;
	padding:0;
	margin-top: -3cm -4mm 0 0 ;
}
.MsoNormal, .MsoNormalTable{
	padding:0; margin:0;
	color:darkmagenta; background:honeydew; 
	font: oblique 14pt/95% Calibri,Verdana,Arial !important;
}

.MsoNormal span, .MsoNormalTable span{
  font-family: inherit !important; font-size: inherit !important;
  font-style: inherit !important; color: inherit !important;
}
span[font-family=Arial], span[font-family="Times New Roman"], font[face=Arial] ,font[face="Times New Roman"]{
  font-family: inherit !important; font-size-adjust:inherit !important;
  font-size: inherit !important; line-height: inherit !important;
  color: inherit !important;
}
/* vim: sts=2 sw=2 ts=2 si sc ai
*/
  </style>
</head>
<body>
<p> </p>
<br>
<br>
Mike Snitzer wrote:
<blockquote id="mid_20120725210434_GA20135_redhat_com"
 cite="mid:20120725210434.GA20135@redhat.com" type="cite"><br>
  <blockquote id="StationeryCiteGenerated_1" type="cite">
    <pre wrap="">
I have 12 data disks in a RAID 50 (3 RAID5's in a RAID0) and use a suggested
stripesize of 64k, so a stripe-width of 768k.
    </pre>
  </blockquote>
</blockquote>
I must state this correction -- to the above -- I was thinking I had to<br>
use the least common multiplier -- but in reality, I <span class="moz-txt-underscore"><span class="moz-txt-tag">_</span>think<span class="moz-txt-tag">_</span></span> (subject to<br>
later revision, both -- reality and what I think, ;-)), I should be
able to<br>
use the greatest common denominator&nbsp; and that should work<br>
equally well.<br>
<br>
Nevertheless, this:<br>
<blockquote id="mid_20120725210434_GA20135_redhat_com"
 cite="mid:20120725210434.GA20135@redhat.com" type="cite">
  <pre wrap=""><!---->
The DM update for the 3.6 merge window adds non power of 2 support in
the kernel (for the stripe and thin-pool targets).

So the lvm2 constraints that require a power of 2 chunksize will be
relaxed very shortly.
  </pre>
</blockquote>
is great news, as I'm sure that being able to synchronize stripes to<br>
chunksize AND extent size, would allow better performance for RAID aware<br>
file systems...<br>
<br>
I.e. As it is now, I need to have my extents line up, my chunks line up<br>
AND my file system block allocations line up....<b class="moz-txt-star"><span class="moz-txt-tag">*</span>ouch<span class="moz-txt-tag">*</span></b>....<br>
<br>
If any of those start at 'fixed offsets' from the beginnning of their<br>
space and that fixed size isn't a multiple of the extent size (for VG's)<br>
OR chunksize for LV's, then all of the VG's/LV's will won't line up --<br>
this is only an issue if you have multiple VG's per PV (i.e. the PV's<br>
will use the same physical disks, and the LV's would also use the same<br>
disks, but what you thought was an aligned database mirrored in<br>
1 partition might be completely non-aligned if anything under it is<br>
&nbsp;&nbsp;&nbsp; misaligned.<br>
<br>
I very well do NOT know, the full impact of such -- only that it would<br>
cause unpredictable or variable performance, which as an engineer,<br>
bothers me.<br>
<br>
<br>
<br>
</body>
</html>

--------------030303080700060704080401--
