Return-Path: <mason@suse.com>
Date: Fri, 13 Apr 2001 19:53:58 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [reiserfs-list] Re: [linux-lvm] mounting reiserfs snapshot
 fails
Message-ID: <398930000.987209638@tiny>
In-Reply-To: <200104140023.f3E0NSIm014650@webber.adilger.int>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@sistina.com
Cc: reiserfs-list@namesys.com


On Friday, April 13, 2001 06:23:28 PM -0600 Andreas Dilger
<adilger@turbolinux.com> wrote:

> Ed Tomlinson writes:
>> Using debian sid, 2.4.3-ac5, lvm 0.91 beta7, with the vfs locking
>> patch applied I get:
>> 
>> oscar# mount /dev/lv/snap /snap -t reiserfs -oro
>> mount: wrong fs type, bad option, bad superblock on /dev/lv/snap,
>>        or too many mounted file systems
>> 
>> When trying to mount the snap shot.  It was created with: 
>> lvcreate -L 1G -s -n snap /dev/lv/root /dev/hdg1
>> without problems
> 
> Are you sure that the VFS patch is applied, and that the LVM and
> reiserfs code was compiled with "enable VFS patch" (whatever it is
> called) enabled?  That has been a source of problems in the past.
> The patch was applied, but you also need to enable it for both the
> reiserfs and LVM code.

That would be a different error, reiserfs would complain that it found a
filesystem, but was unable to mount it because it needed replay and the
device was readonly.  In this case, the snapshot is not a valid FS at all,
even though the source looks fine.

I'll upgrade to the latest LVM and try to reproduce...

-chris
