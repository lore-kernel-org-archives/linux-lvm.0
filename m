Message-ID: <4F742FDD.1010204@redhat.com>
Date: Thu, 29 Mar 2012 11:48:13 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4F6ECF9B.40907@nuclearwinter.com>
	<20120326155540.19c85fe9@bettercgi.com>
	<4F7100EC.6070406@nuclearwinter.com> <4F71CFFF.6090909@redhat.com>
	<4F722FFF.4010703@nuclearwinter.com>
	<4F72C38E.2080806@redhat.com> <4F7357C3.4060205@bmsi.com>
In-Reply-To: <4F7357C3.4060205@bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM commands extremely slow during raid check/resync
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 28.3.2012 20:26, Stuart D Gathman napsal(a):
> Long ago, Nostradamus foresaw that on 03/28/2012 03:53 AM, Zdenek Kabelac
> would write:
>> It seems that your cfq scheduler should be tuned better for raid arrays - I
>> assume you allow the system to create very large queues of buffers and your
>> mdraid isn't fast enough to store dirty pages on disk - I'd probably suggest
>> to significantly lower the maximum amount of dirty pages - as creation of
>> snapshot requires fs sync operation it will need to wait till all buffers
>> before the operation are in place.
> A question (or minor nit): how could lvm possibly require a fs sync to create
> a snapshot?  I could see this for Xen, where guest OS has to support a com
> channel to host.  But for full virtualization, LVM doesn't know in general
> what OS is running, or how to suggest an FS sync.  Or is this something an
> admin does, run a script that tells guest to sync before creating shapshot
> through lvm (to maximize the amount of useful data in the snapshot)?

You may check the man page for dmsetup suspend operation - options  nolockfs
and noflush.

For lvm creation of snapshot I guess everyone wants to get the filesystem in
'stable' condition - so all in-flight operation before creation of snapshot
happened should hit the disk - and if you run fsck you should get pretty
consistent results.

Or thin it would be preferable that flush & lockfs part should be skipped at
this moment and users would get their snapshot fs in quite broken state ?

zdenek
