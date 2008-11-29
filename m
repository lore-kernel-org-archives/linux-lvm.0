Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mATFDfYe008522
	for <linux-lvm@redhat.com>; Sat, 29 Nov 2008 10:13:41 -0500
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.233])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mATFDVgG003046
	for <linux-lvm@redhat.com>; Sat, 29 Nov 2008 10:13:32 -0500
Received: by rv-out-0506.google.com with SMTP id f6so1999568rvb.51
	for <linux-lvm@redhat.com>; Sat, 29 Nov 2008 07:13:31 -0800 (PST)
Message-ID: <41519ea60811290713g46083998v6c42bb7b578f1472@mail.gmail.com>
Date: Sat, 29 Nov 2008 16:13:31 +0100
From: "Fabio Coatti" <fabio.coatti@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] pvresize complains about too many metadata
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
To: linux-lvm@redhat.com

Hi all, I'm playing a bit with lvm/raid on linux, (on a pretty
experimental box) and now I'm facing a problem that leaves me a bit
stuck

Basically, I've a volume group based on several mdraid partition
(vg1  with md0/md1/md4 as pvs)

recently I've increased the size of md1/md4 arrays by adding more
disks and /proc/mdstats shows that the operation was successful.

the  I've issued a "pvresize" command on /dev/md1 and md4 to make lvm
aware of new size, but I get the following error:

pvresize -v /dev/md1
    Using physical volume(s) on command line
    Archiving volume group "vg1" metadata (seqno 12).
  /dev/md1: too many metadata areas for pvresize
  0 physical volume(s) resized / 1 physical volume(s) not resized


pvck -v /dev/md1
    Scanning /dev/md1
  Found label on /dev/md1, sector 1, type=LVM2 001
  Found text metadata area: offset=4096, size=192512
    Found LVM2 metadata record at offset=10240, size=2048, offset2=0 size2=0
    Found LVM2 metadata record at offset=9728, size=512, offset2=0 size2=0
    Found LVM2 metadata record at offset=8192, size=1536, offset2=0 size2=0
  Found text metadata area: offset=386587820032, size=131072
    Found LVM2 metadata record at offset=386587826176, size=2048,
offset2=0 size2=0
    Found LVM2 metadata record at offset=386587824128, size=2048,
offset2=0 size2=0
    Found LVM2 metadata record at offset=386587822592, size=1536,
offset2=0 size2=0


Can someone give me some hint, to shed some light on what's going on?
obviously I've made something wrong, but I can't figure what (maybe
unusual or not the best way to increase space, ok, but I can't figure
out what's up).

Thanks for any answer.
