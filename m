Date: Mon, 24 Sep 2001 13:18:40 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Volume group not found????
Message-ID: <20010924131840.B30558@sistina.com>
References: <200109202358.AA1744437478@netcentricnj.com>
Mime-Version: 1.0
In-Reply-To: <200109202358.AA1744437478@netcentricnj.com>; from tdwebste@netcentricnj.com on Thu, Sep 20, 2001 at 11:58:01PM -0400
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Tim,

does vgscan find your volume group?
Which LVM version do you use?

On Thu, Sep 20, 2001 at 11:58:01PM -0400, tim wrote:
> It seems I have a similar problem to poor Alexander Bruns.
> This whole this is giving me big head heack.
> 
> Luckily I only have /usr and /var as logical volumes. So I am still able to boot.
> 
> I created logical volume partitions /dev/sda4 /dev/sdb5
> Then created stripped lvm's lv_usr and lv_var
> 
> Reboot several times and everything worked well.
> 
> I see /dev/system/lv_usr, /dev/system/lv_var, /etc/lvmconf/sytem.conf
> 
> However vgchange fails
> vgchange -a y
> vgchange -- no volume groups found
> 
> 
> /proc/lvm/VGs/
> no logical volumes
> 
> How can I recover?
> 
> 
> -tim. 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
