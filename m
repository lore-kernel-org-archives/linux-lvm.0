From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Fw: Logical volume is smaller than physical drive.
Message-ID: <20020704111859.A9129@sistina.com>
References: <006101c221c3$2266d8a0$8606a8c0@julio>
Mime-Version: 1.0
In-Reply-To: <006101c221c3$2266d8a0$8606a8c0@julio>; from julio@centershop.com.br on Tue, Jul 02, 2002 at 09:22:27AM -0300
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
Date: Thu Jul  4 04:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Julio,

please provide the output of "vgdisplay -v vg" to better understand
what's happening before and after adding /dev/md1.

On Tue, Jul 02, 2002 at 09:22:27AM -0300, Julio wrote:
> I have a  16G Raid 1 ( 2 scsi drives ) . 
> I added it to a vg called vg ( vgcreate vg /dev/md1 ) and then tried to create a logical volume of 16G. ( lvcreate -L16G -nmy_volume vg).
> It failed and said that there was no space avaliable.
> 'vgdisplay vg'  showed that i had only 10G avaliable. where are my other 6G ;) ??
> Have any of you been thru something similer ?
> 
> Thanx !
> 
> Julio Faerman
-- 

Regards,
Heinz    -- The LVM Guy --

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
