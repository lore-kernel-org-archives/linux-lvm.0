Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i22JWn823945
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 14:32:50 -0500
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Message-ID: <yw1xsmgravu1.fsf@kth.se>
References: <001301c40041$7fdeab30$0400a8c0@vector> <yw1xy8qjxxgt.fsf@kth.se>
 <002a01c40085$2c03e680$0400a8c0@vector>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: What if a drive dies ?
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  2 14:31:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

"Perplexer" <perplexer@thz.net> writes:

> Ahh I made a major typo .... it's a linear setup, not a striped one.
>
> You mentioned anyway that a recovery would be somewhat possible.
> I'm using ext3 journaling fs on my LV.

That's what I had.

> Would I be able to mount this LV if one PV died, meaning I would see
> all data except the part that was lost with that drive or would I
> need to do anything special to make the LV mountable again ?

It will depend on which part of the filesystem is lost.  I had a 10 GB
LV with various source code packages on it and lost maybe 2 GB
somewhere in the middle of it.  Obviously, everything on the dead disk
was lost.  The rest was mostly recovered, but many of the files ended
up in lost+found.

A different 20 GB LV had some 10-15 files each 0.5-1 GB in the root,
and no subdirectories.  This LV lost a GB or two at the beginning.
All the files were gone, even those that were stored entirely on a
good disk.  The reason for this was that all the inode information for
the root directory was stored on the bad part.

I don't know how other filesystems will deal with such situations.
I'm running RAID now to be somewhat safer.  It was a good thing too,
since one of the replacement disks turned out to be bad.

-- 
M�ns Rullg�rd
mru@kth.se
