Message-ID: <3F90395D.5000500@siue.edu>
From: anthony mayes <anmayes@siue.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: LVM ext3 support
References: <3F903230.9070608@siue.edu> <yw1xptgvk92l.fsf@users.sourceforge.net>
In-Reply-To: <yw1xptgvk92l.fsf@users.sourceforge.net>
Content-Type: multipart/alternative;
 boundary="------------050908020709020003050200"
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Oct 17 15:02:13 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------050908020709020003050200
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.isg.siue.edu id NAA13026

How would you suggest making it writable?

--=20
Anthony Mayes
UNIX Server Administration
Southern Illinois University Edwardsville
anmayes@siue.edu

M=E5ns Rullg=E5rd wrote:

>anthony mayes <anmayes@siue.edu> writes:
>
> =20
>
>>I am running Redhat 9 with kernel 2.4.20-20.9.  I am getting the
>>following errors when trying to mount an LVM snapshot:
>>
>>EXT3-fs: INFO: recovery required on readonly filesystem.
>>EXT3-fs: write access unavailable, cannot proceed.
>>
>>I saw a thread on redhat.com that said a kernel patch is needed.  My
>>   =20
>>
>
>BS.  You are trying to mount a non-clean filesystem on a read-only
>LV.  I don't know why your LV is read-only.  You should find out why
>it is, make it writable, and run fsck on it.  After that, you should
>be able to mount it.
>
> =20
>


--------------050908020709020003050200
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
How would you suggest making it writable?<br>
<br>
<pre class="moz-signature" cols="72">-- 
Anthony Mayes
UNIX Server Administration
Southern Illinois University Edwardsville
<a class="moz-txt-link-abbreviated" href="mailto:anmayes@siue.edu">anmayes@siue.edu</a></pre>
M&aring;ns Rullg&aring;rd wrote:<br>
<blockquote type="cite" cite="midyw1xptgvk92l.fsf@users.sourceforge.net">
  <pre wrap="">anthony mayes <a class="moz-txt-link-rfc2396E" href="mailto:anmayes@siue.edu">&lt;anmayes@siue.edu&gt;</a> writes:

  </pre>
  <blockquote type="cite">
    <pre wrap="">I am running Redhat 9 with kernel 2.4.20-20.9.  I am getting the
following errors when trying to mount an LVM snapshot:

EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access unavailable, cannot proceed.

I saw a thread on redhat.com that said a kernel patch is needed.  My
    </pre>
  </blockquote>
  <pre wrap=""><!---->
BS.  You are trying to mount a non-clean filesystem on a read-only
LV.  I don't know why your LV is read-only.  You should find out why
it is, make it writable, and run fsck on it.  After that, you should
be able to mount it.

  </pre>
</blockquote>
<br>
</body>
</html>

--------------050908020709020003050200--
