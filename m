Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6JDMhNf000597
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 09:22:43 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6JDMW7P031466
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 09:22:32 -0400
Received: from [192.168.10.38] (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o6JDMV0H019580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 09:22:31 -0400
Message-ID: <4C445196.7030203@bmsi.com>
Date: Mon, 19 Jul 2010 09:22:30 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <846462.8576.qm@web137317.mail.in.yahoo.com>
In-Reply-To: <846462.8576.qm@web137317.mail.in.yahoo.com>
Content-Type: multipart/alternative;
	boundary="------------060702070001050705090305"
Subject: Re: [linux-lvm] COW store
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------060702070001050705090305
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/19/2010 07:14 AM, andiket a wrote:
> Is it possible to specify a different device or to be specific a
> different VG than original VG to create a cow store for snapshot.
>
> If I have a an LV in VG1 then I don't snapshot to create cow store
> (snapshot LV) on same VG but to use VG2.
>

Short answer: no

Long answer: support for this would defeat the purpose of volume
groups.  VGs have independent metadata so that you can remove them
independently, move between system, and so on.  If a misguided soul were
to implement your feature, then the two volume groups would have to be
"locked together" so that removing one or the other would invalidate the
snapshot.  For similar reasons, you cannot hardlink files between unix
filesystems.

If you are using volume groups for the naming only, try using a
separator in your LV names.  (LVM lawyers - what are legal chars to
use?)  For instance, I know '_' is safe, so for example instead of
vgabc/lv1 and vgdef/lv2, where you are willing to "entangle" vgabc and
vgdef because they are always online together, just make a single vgroot and
use vgroot/abc_lv1 vgroot/def_lv2.

BTW, A feature that would make more sense would be hierarchical
namespace for LVs within a VG, i.e. subdirs within the /dev/vg*
directory.  Very low priority, and tricky, but would be handy for naming
purposes.


--------------060702070001050705090305
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
On 07/19/2010 07:14 AM, andiket a wrote:
<blockquote cite="mid:846462.8576.qm@web137317.mail.in.yahoo.com"
 type="cite">
  <table cellpadding="0" cellspacing="0" border="0">
    <tbody>
      <tr>
        <td
 style="font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-size: inherit; line-height: inherit; font-size-adjust: inherit; font-stretch: inherit; -x-system-font: none;"
 valign="top">Is it possible to specify a different device or to be
specific a different VG than original VG to create a cow store for
snapshot.<br>
        <br>
If I have a an LV in VG1 then I don't snapshot to create cow store
(snapshot LV) on same VG but to use VG2.<br>
        </td>
      </tr>
    </tbody>
  </table>
</blockquote>
<br>
Short answer: no<br>
<br>
Long answer: support for this would defeat the purpose of volume
groups.  VGs have independent metadata so that you can remove them
independently, move between system, and so on.  If a misguided soul
were to implement your feature, then the two volume groups would have
to be "locked together" so that removing one or the other would
invalidate the snapshot.  For similar reasons, you cannot hardlink
files between unix filesystems.<br>
<br>
If you are using volume groups for the naming only, try using a
separator in your LV names.  (LVM lawyers - what are legal chars to
use?)  For instance, I know '_' is safe, so for example instead of
vgabc/lv1 and vgdef/lv2, where you are willing to "entangle" vgabc and
vgdef because they are always online together, just make a single
vgroot and<br>
use vgroot/abc_lv1 vgroot/def_lv2.<br>
<br>
BTW, A feature that would make more sense would be hierarchical
namespace for LVs within a VG, i.e. subdirs within the /dev/vg*
directory.  Very low priority, and tricky, but would be handy for
naming purposes.<br>
<br>
</body>
</html>

--------------060702070001050705090305--
