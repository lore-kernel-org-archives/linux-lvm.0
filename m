From: "Kalle" <kalle@idlar.nu>
Message-Id: <E17kRqI-0000ab-00@hermes.sistina.com>
Subject: [linux-lvm] RE: Urgent, Moving disk from hdc to hdf in existing lvm
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
Date: Thu Aug 29 11:10:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

-"howly magic lvm, batman"...it was that easy! :)

btw.. I was digging though the /etc/lvmtab.d and /etc/lvmconf, thats the metadata right?

I did a "strings /etc/lvmtab.d/raidset1" before I ran vgscan, and it listed the old device names.

Should it have been possible to edit that file with a hexeditor and gotten the same result?
Whats the difference between the dir /etc/lvmtab.d and /etc/lvmconf dir?


/Regards Kalle

>Kalle,
>
>any configuration change schould be happily covered by "vgscan ; vgchange -ay".
>
>vgscan figures out all PVs by UUID and groupd them together no matter to
>which changed path they are attached.
>
>Regards,
>Heinz    -- The LVM Guy --
>
>
>On Thu, Aug 29, 2002 at 06:19:27AM -0500, kalle@idlar.nu wrote:
>> Hello!
>> 
>> We have a problem with one of our servers thats running lvm on linux-2.4.19.
>> We have 4 discs in the vg, hdb, hdc, hdg and hdh.
>> When we booted the server this morning hdc did not get online. 
>> We've tried diffrent cables but there seems to be some problem with the secondary controller.
>> The disc gets online if we put it on the promise controller thats handeling hdg and hdh.
>> 
>> Is it possible to "reconfigure" the vg so that the disk that once was hdc will be hdf? Prefably without loosing data.
>> 
>> Unfortunately we dont have any spare box to move the disks to, so the reconfiguring has to be done with 
>> the old hdc disk already beeing installed as hdf.
>> 
>> Any comments appreciated!
>> 
>> 
>> /Regards Kalle
>> 
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@sistina.com
>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
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
