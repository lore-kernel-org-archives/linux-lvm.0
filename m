From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] filesystem errors
Message-Id: <20020304112801.D10007@sistina.com>
References: <Pine.LNX.4.44.0203011542510.31215-100000@tassadar.physics.auth.gr>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0203011542510.31215-100000@tassadar.physics.auth.gr>;
    from dzila@tassadar.physics.auth.gr on Fri, Mar 01, 2002 at 03:56:04PM
    +0200
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
Date: Mon Mar  4 04:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Mar 01, 2002 at 03:56:04PM +0200, Dimitris Zilaskos wrote:
> 
>  Hello ,
>  I have setup an lvm consisted of 10 loopback attached files which are
> exported with samba from windows2000 workstations . Occasionaly , during
> write operations i get messages like the following
> 
> 
> EXT2-fs error (device lvm(58,0)): read_inode_bitmap: Cannot read inode
> bitmap - block_group = 1521, inode_bitmap = 49840129
> EXT2-fs error (device lvm(58,0)): read_block_bitmap: Cannot read block
> bitmap - block_group = 1521, block_bitmap = 49840128
> 
> after that i must perform a umount and filesystem check which finds and
> fixes some errors . Data is usually only slightly damaged .  Read operations
> work fine no matter how intensive they are .
> 
> On kernel 2.4.16 , there were no such errors but there were oopses , again
> during write operations . From 2.4.17 to the 2.4.18-ac1 i am using now ,
> the ext2 errors showed up .  The lvm tools version is 1.0.3 . All kernels
> are smp .
>  I did several huge transfers between the workstations and the linux box ,
> as well as pings with big packets to make sure the networking is ok , and
> it seems to be . No packetloss with 65000 bytes packets ,no suspicious
> delays . I really want to track this problem down . Any help is
> appreciated .

Because you mention *huge* transfers the usual suspect is the VM subsystem IMO.
Did you try 2.4.<10 which didn't have the faulty VM subsystem?


> 
>  Kind regards
> 
> --
> =============================================================================
> 
> Dimitris Zilaskos
> 
> Department of Physics @ Aristotle Univercity of Thessaloniki , Greece
> =============================================================================
> 
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
