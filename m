From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM is wont restore. DESPERATE. PLEASE HELP!
Message-ID: <20021216165924.C19655@sistina.com>
References: <20021211053254.IDFV22279.mta06.mail.mel.aone.net.au@[127.0.0.1]>
Mime-Version: 1.0
In-Reply-To: <20021211053254.IDFV22279.mta06.mail.mel.aone.net.au@[127.0.0.1]>; from acpretty@ozemail.com.au on Wed, Dec 11, 2002 at 04:32:54PM +1100
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
Date: Mon Dec 16 10:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Alex,

you may want to try uuid_fixer which i've send to you in direct mail.

Run "uuid_fixer YourPV1 YourPV2" and answer yes to the update question.

The run "vgscan; vgchange -ay".

Regards,
Heinz    -- The LVM Guy --

On Wed, Dec 11, 2002 at 04:32:54PM +1100, acpretty@ozemail.com.au wrote:
> Hey all, 
>   If someone is around who could help me it would be SO appreciated. 
> 
> I have a volume group (vg00) with two physical volumes in it.     
> 
> with in about half an hour .....
>    I extended one of the logical volumes, no probs
>    I extended the file system, noprobs 
>    was doing a large-ish transfer to my enlarged fs when the machine crashed...
> 
> upon restarting the machine told me I had inconsistencies in my PV's so I did a vgcfgrestore. Now upon restarting I get no acknowledgement of the volume group at all....
> 
> SO! I thought I'd try and force a vgimport of the volume group only to find that vgimport says that the two PV's in the VG are not from the same VG. 
> 
> now I'm a bit lost, if anyone could help, PLEASE!!!! I have one last thing I think I should try but I'm uncertain. 
> 
> When I run pvdata the bit at the bottom says:
> 
>   --- List of physical volume UUIDs ---
> 
>   001: EtJbdT-qZBP-P6Bf-yRwi-I4Bn-0qzS-L13XYu
>   002: --- EMPTY ---
> 
> shouldn't each PV know about all the other PV's UUID's in this list and therefore can anyone tell me if using the UUID fixer program is the thing to do?
> 
> more importantly can anyone tell me how much of the partitions I need to dd in order to preserve the meta data in case this doesn't help
> 
> Thanks reading this far and thanks in advance to the help
> Alex
> 
> This message was sent through MyMail http://www.mymail.com.au
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
