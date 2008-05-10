Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4A185iO023208
	for <linux-lvm@redhat.com>; Fri, 9 May 2008 21:08:05 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.177])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4A17ofR028016
	for <linux-lvm@redhat.com>; Fri, 9 May 2008 21:07:50 -0400
Received: by py-out-1112.google.com with SMTP id a29so1290052pyi.0
	for <linux-lvm@redhat.com>; Fri, 09 May 2008 18:07:49 -0700 (PDT)
Message-ID: <4824F560.208@davidcoulson.net>
Date: Fri, 09 May 2008 21:07:44 -0400
From: David Coulson <david@davidcoulson.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Offline fsck (checking snapshots)
References: <48110C2D.5020800@kadzban.is-a-geek.net>
In-Reply-To: <48110C2D.5020800@kadzban.is-a-geek.net>
Content-Type: multipart/alternative;
	boundary="------------060209080000070809000205"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------060209080000070809000205
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've been playing with this script today - Is there a more current 
version, or someone who maintains it? There are a bunch of things that 
seem to be broken that I ended up cleaning up on my own (e.g. it 
calculates the snapshot size in M, then creates it in extents...).

I imagine there are other users who are frustrated with it, as it does 
not run cleanly as it is.

David

Bryan Kadzban wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: RIPEMD160
>
> There was some discussion on the ext3-users list a few months ago, about
> how e2fsck took a long time to run, and it was getting forced because it
> keeps track of a couple of counters that can force it (the counters are
> days since the last full fsck, and mounts since the last full fsck).
> (The thread starts at [1], the script development started at [2], and
> the most recent version is at [3].  The one extra thing I've added is
> skipping ext2/3 FSes that have an external journal.)
>
> The suggestion was made that if the user is using LVM, a temporary
> snapshot could be taken, and then fsck could be run on that.  If it
> succeeds, then it's possible to set the last-fsck-time and mount-count
> while the real FS is mounted.
>
> I've gotten a script that I think is reasonable, that handles this.
> With some help from others, it now works with XFS as well as ext2/3, and
> it's supposed to also work with JFS.  Since it requires LVM, I think it
> might make sense to put something like it into the LVM userspace tools.
>
> (There is one issue: it also requires blkid and logsave from e2fsprogs.
> I could work around the requirement for logsave (using tee -a), but
> blkid would be harder.)
>
> The idea behind the script is, you run it at night from cron; it will
> check each LV on the system and mail a user if there are any problems.
> It also logs to syslog.
>
> I've attached the script and its configuration file to this message.
> Comments?
>
> [1] https://www.redhat.com/archives/ext3-users/2008-January/msg00027.html
>
> [2] https://www.redhat.com/archives/ext3-users/2008-January/msg00032.html
>
> [3]
> https://www.redhat.com/archives/ext3-users/2008-February/msg00004.html
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>
> iD8DBQFIEQwpS5vET1Wea5wRA43cAKDWGJVFgV6fmJKeQUgcPH6Ebd1aygCfb4a9
> TbiWVGUYFnPeQSWiJVl0x2k=
> =Juq0
> -----END PGP SIGNATURE-----
>   
> ------------------------------------------------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--------------060209080000070809000205
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
I've been playing with this script today - Is there a more current
version, or someone who maintains it? There are a bunch of things that
seem to be broken that I ended up cleaning up on my own (e.g. it
calculates the snapshot size in M, then creates it in extents...).<br>
<br>
I imagine there are other users who are frustrated with it, as it does
not run cleanly as it is.<br>
<br>
David<br>
<br>
Bryan Kadzban wrote:
<blockquote cite="mid:48110C2D.5020800@kadzban.is-a-geek.net"
 type="cite">
  <pre wrap="">-----BEGIN PGP SIGNED MESSAGE-----
Hash: RIPEMD160

There was some discussion on the ext3-users list a few months ago, about
how e2fsck took a long time to run, and it was getting forced because it
keeps track of a couple of counters that can force it (the counters are
days since the last full fsck, and mounts since the last full fsck).
(The thread starts at [1], the script development started at [2], and
the most recent version is at [3].  The one extra thing I've added is
skipping ext2/3 FSes that have an external journal.)

The suggestion was made that if the user is using LVM, a temporary
snapshot could be taken, and then fsck could be run on that.  If it
succeeds, then it's possible to set the last-fsck-time and mount-count
while the real FS is mounted.

I've gotten a script that I think is reasonable, that handles this.
With some help from others, it now works with XFS as well as ext2/3, and
it's supposed to also work with JFS.  Since it requires LVM, I think it
might make sense to put something like it into the LVM userspace tools.

(There is one issue: it also requires blkid and logsave from e2fsprogs.
I could work around the requirement for logsave (using tee -a), but
blkid would be harder.)

The idea behind the script is, you run it at night from cron; it will
check each LV on the system and mail a user if there are any problems.
It also logs to syslog.

I've attached the script and its configuration file to this message.
Comments?

[1] <a class="moz-txt-link-freetext" href="https://www.redhat.com/archives/ext3-users/2008-January/msg00027.html">https://www.redhat.com/archives/ext3-users/2008-January/msg00027.html</a>

[2] <a class="moz-txt-link-freetext" href="https://www.redhat.com/archives/ext3-users/2008-January/msg00032.html">https://www.redhat.com/archives/ext3-users/2008-January/msg00032.html</a>

[3]
<a class="moz-txt-link-freetext" href="https://www.redhat.com/archives/ext3-users/2008-February/msg00004.html">https://www.redhat.com/archives/ext3-users/2008-February/msg00004.html</a>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - <a class="moz-txt-link-freetext" href="http://enigmail.mozdev.org">http://enigmail.mozdev.org</a>

iD8DBQFIEQwpS5vET1Wea5wRA43cAKDWGJVFgV6fmJKeQUgcPH6Ebd1aygCfb4a9
TbiWVGUYFnPeQSWiJVl0x2k=
=Juq0
-----END PGP SIGNATURE-----
  </pre>
  <pre wrap=""><pre wrap=""><pre wrap="">
<hr size="4" width="90%">
_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre></pre></pre>
</blockquote>
</body>
</html>

--------------060209080000070809000205--
