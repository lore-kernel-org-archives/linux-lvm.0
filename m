From: Anders Widman <andewid@tnonline.net>
In-Reply-To: <20020116160844.A19969@sistina.com>
Message-Id: <SQRLYX83ZW72YU3V1JEECAXRPJA21.3c45c633@kadzuki>
Subject: Re: [linux-lvm] Pvmove fails... No free PE's
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Date: Wed Jan 16 12:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

No, my LV is not striped, so this should have worked. Well.. I have bought another disk and will move all pe's to that one instead. Hopefully this will work better.

//Anders

2002-01-16 16:08:44, "Heinz J . Mauelshagen" <mauelshagen@sistina.com> wrote:

>
>Anders,
>
>is your LV striped? In this case, pvmove complains because it can't
>move 2 stripes onto one PV.
>
>If so, you need another disk to be pvcreated/vgextend to your VG in order
>to pvmove data over.
>
>On Wed, Jan 16, 2002 at 07:52:18AM +0100, Anders Widman wrote:
>> I have a bad disk (hdl1) that needs to be replaced. It is 40GB, or 1220 PE's. I have another disk which is about 120GB, but has 1221 free PE's. Both disks are in the same VG, Server and the same LV, 
>> FTPRoot. When I try "pvmove -v /dev/hdl1" it failes (doesn't even start, really) and tells me I haven't any free PE's.
>> 
>> What can I have missed...
>> 
>> 1) I shrick the filesystem first with about 60GB
>> 2) I use lvreduce to shrick the LV with about 59GB
>> 3) I tried "pvmove -v /dev/hdl" to move all PE's on this 40GB disk to the free ones on the other disks. This should have worked, shoudln't it?
>> 
>> have I missed something critical?
>> 
>> //Anders
>> 
>> 
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@sistina.com
>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>-- 
>
>Regards,
>Heinz    -- The LVM Guy --
>
>*** Software bugs are stupid.
>    Nevertheless it needs not so stupid people to solve them ***
>
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>Heinz Mauelshagen                                 Sistina Software Inc.
>Senior Consultant/Developer                       Am Sonnenhang 11
>                                                  56242 Marienrachdorf
>                                                  Germany
>Mauelshagen@Sistina.com                           +49 2626 141200
>                                                       FAX 924446
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
