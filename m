From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Message-ID: <yw1xr829kps6.fsf@users.sourceforge.net>
References: <yw1xzngxktrs.fsf@users.sourceforge.net> <20030922123435.X2618@sistina.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Resizing PV
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
Date: Mon Sep 22 06:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" <mauelshagen@sistina.com> writes:

>> Is it possible to reduce the size of a PV, freeing some space at the
>> end?  I can make sure that the end is unused, of course.
>
> No such command implemented yet.
>
> Hack:
> you can use LVM2 and change the text format of the metadata by hand
> before running vgcfgrestore to store it back onto the PVs.
>
> If you want to follow this non-supported path, you want to take a
> copy of the original metadata file in /etc/lvm/backup/ to be able to
> back out gain.

I'm already using lvm2.  I noticed the pvresize command, but it just
says it's not implemented yet.  Any chance it will be some time soon?

As for editing the metadata, I'm a little confused about the meaning
of some fields.  After running vgcfgbackup, I have this in the file:

        physical_volumes {

                pv0 {
                        id = "eZV4mb-jk4z-pyfm-tGbJ-mBSW-drRT-ZHtgmn"
                        device = "/dev/discs/disc0/part2"       # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 65920
                        pe_count = 1189 # 37.1562 Gigabytes
                }
        }

What is the meaning of the pe_start field?  If I wanted to reduce the
size by, say, 1 GB, would it be correct to reduce pe_count by 32, the
PE size being 32 MB?

-- 
M�ns Rullg�rd
mru@users.sf.net
