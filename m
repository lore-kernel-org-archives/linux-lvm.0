Date: Thu, 27 Sep 2001 11:09:28 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Disk Died - Ideas?
Message-ID: <67220000.1001606968@dizzy>
In-Reply-To: <20010927095516.C19527@turbolinux.com>
References: <3BB09C88.8234FDE4@lmco.com>
 <20010925110909.D392@turbolinux.com> <3BB30FD9.853E39DA@lmco.com>
 <53040000.1001601637@dizzy> <20010927095516.C19527@turbolinux.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Andreas Dilger <adilger@turbolabs.com>

> On Sep 27, 2001  09:40 -0500, Steven Lembark wrote:
>> <broken record>
>>
>> boot once.
>>
>> vgexport /dev/vgwhatever;
>> vgimport /dev/vgwhatever <list of drives that didn't croak>
>>
>> you will now have your VG back on line with whatever portion of the
>> data is no the clean drives.  any LV's spanning the dead drive are
>> likely to be lost anyway.  It'll take you less time to vgextend the
>> imported group onto a new, working drive an recover backups onto
>> new LV's than almost anything else you can try.
>>
>> </broken record>
>
> bzzzt.  This _may_ work on HPUX and AIX, but I _highly_ doubt it will
> work with Linux LVM.  The Linux LVM code requires that all of the disks
> be present, and that they all have the correct data (no metadata backups
> yet).  You could hack the vgscan code so that it doesn't require this,
> but it would probably end up causing grief somewhere else before you
> could actually read from the LV.
>
> AFAIK, not even HPUX or AIX would allow you to read from a partial LV
> (which is the situation we are discussing here), so it wouldn't help.
> What _would_ be very useful is a tool that reads the LVM metadata
> directly, creates a list of available LEs (in order) and dumps them
> to a file, writing zeros for LEs that are not available (and writing
> large warnings for each missing LE).

Hmmm...  this is what I've used repeatedly to get drives back when LVM
croaks on me and doesn't like the VG's.  None of the commercial LVM
products allow reading from partial LV's.  Point I made was that it's
usually simpler to give up, get the volumes back on line, vgextend onto
working PV's and restore from backup.  Main problem with anything that
reads partial LV's is that you can only recover raw data, which will
normally leave you with a badly scrambled file system (e.g., ext2)
rather than any kind of real "data" you can manage -- unless you're
into locating inodes and extracting the block information then trying
to jigsaw that out of the LV recovery data.

--
Steven Lembark                                               2930 W. Palmer
Workhorse Computing                                       Chicago, IL 60647
                                                            +1 800 762 1582
