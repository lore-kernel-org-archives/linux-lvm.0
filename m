Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3RNbwmp008674
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 19:37:58 -0400
Received: from nlpi015.prodigy.net (nlpi015.sbcis.sbc.com [207.115.36.44])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3RNbWbk005835
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 19:37:36 -0400
Received: from mail.kdzbn.homelinux.net
	(adsl-75-40-228-163.dsl.klmzmi.sbcglobal.net [75.40.228.163])
	(authenticated bits=0)
	by nlpi015.prodigy.net (8.13.8 smtpauth/dk/8.13.8) with ESMTP id
	m3RNbP2A011299
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 18:37:26 -0500
Received: from beta.mydomain ([192.168.2.237])
	by mail.kdzbn.homelinux.net with esmtp (Exim 4.62)
	(envelope-from <bryan@kadzban.is-a-geek.net>) id 1JqGQw-0007ie-6D
	for linux-lvm@redhat.com; Sun, 27 Apr 2008 19:37:26 -0400
Message-ID: <48150E36.7090708@kadzban.is-a-geek.net>
Date: Sun, 27 Apr 2008 19:37:26 -0400
From: Bryan Kadzban <bryan@kadzban.is-a-geek.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Offline fsck (checking snapshots)
References: <48110C2D.5020800@kadzban.is-a-geek.net>	<4813D644.7080003@Media-Brokers.com>	<4813E225.7040900@kadzban.is-a-geek.net>
	<4814D88C.3050304@Media-Brokers.com>
In-Reply-To: <4814D88C.3050304@Media-Brokers.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: RIPEMD160

Charles Marcus wrote:
> On 4/26/2008, Bryan Kadzban (bryan@kadzban.is-a-geek.net) wrote:
>> No particular reason, no. I just haven't used it in maybe 6 years,
>> so I don't remember much about it. I also assume that nobody
>> listening to the discussion on ext3-users uses it either (based on
>> the fact that nobody else asked for it). So it didn't get added.
>> :-)

Actually, now that I look again, there is a case in there for checking
reiserfs, but not for doing anything else (reading or writing the
last-checked date, for instance).

> I know, I've heard all of the horror stories... but my RAID card has
> a BBU on it, and my servers all have good UPS's on them

Some of the horror stories that I've heard are exactly the case that
you're protecting against with your batteries: Supposedly a sudden
removal of power causes some grief with certain journaling methods,
including the method that reiserfs uses.  (Or used to use; maybe it's
changed since then.)

Anyway...

>> I assume fsck.reiserfs is the right executable to use? [...] What 
>> args should be used to get it to check the snapshot FS, preferably 
>> making as few changes as possible?
> 
> Ouch... I wish I could help, I'd be happy to, but I'm just a lowly
> sys admin pretender, not a programmer... ;)

So I should go ask the reiserfs people then.  That's fine.  :-)

> Right now, I'm just trying to find the time to get an automated
> backup script running to pause some services (postfix+dovecot), take
> a snapshot of my /var, restart the services, run rsnapshot on the
> snapshot volume, then release the snapshot volume...

Feel free to use the LVM-specific bits of the script if you want (it is,
after all, GPLv2 or later).  It's just that most of the script focuses
on running fsck, not doing a backup, so it has a bunch of stuff that you
probably don't need.  But the LVM parts are the same no matter which
filesystem is on the logical volume.

Anyway, that's probably the check_fs function and anything that calls
it; you'd probably want to change perform_check to do your backup stuff,
though.  And you won't care about the $fstype stuff that's littered all
over the script, either, if you're just going to run rsnapshot.  (So you
don't need to run blkid either.)  But you can probably get rid of
try_delay_checks and try_force_check, along with on_ac_power.  And
should_still_check, and try_get_check_date.  (Plus the calls in to each
of these functions, of course.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIFQ41S5vET1Wea5wRA96rAKDLUIo7evXELO9i/PDaz+0gG0N8QACfZ6f/
Ze+vrR9TsxnhD4cpkXom4Lg=
=5RRe
-----END PGP SIGNATURE-----
