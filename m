Date: Thu, 23 Aug 2001 22:38:38 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] no lvm question but linux kernel
Message-ID: <20010823223838.A17358@sistina.com>
References: <615A249B783CD41192F400D0B747AC860361D9C6@hesse.bbn.hp.com>
Mime-Version: 1.0
In-Reply-To: <615A249B783CD41192F400D0B747AC860361D9C6@hesse.bbn.hp.com>; from holger_zecha@hp.com on Thu, Aug 23, 2001 at 03:00:30PM +0200
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

Holger,

you hit the wrong list here.
linux-kernel is a better place.

On Thu, Aug 23, 2001 at 03:00:30PM +0200, ZECHA,HOLGER (HP-Germany,ex1) wrote:
> Hello,
> 
> hopefully somebody knows:
> 
> I tried to compile the newest Inter driver for EtherExpress Pro.
> The compileation works fine but afterwards when I execute a modprobe i get
> the followming errors:
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
> unregister_netdev_Rsmp9caf1fb1
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
> eth_type_trans_Rsmp5891d412
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
> netif_rx_Rsmp8f1647ae
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
> proc_net_Rsmp7841cd2d
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
> create_proc_entry_Rsmp9d0ba5fe
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
> __kfree_skb_Rsmp088bdac9
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
> remove_proc_entry_Rsmpbb26f796
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
> init_etherdev_Rsmp11b90d2b
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
> skb_over_panic_Rsmp2ba81f79
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
> alloc_skb_Rsmp40210a6a
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o: insmod
> /lib/modules/2.2.16-22SAPenterprise/net/e100.o failed
> 
> Any idea ?
> 
> Holger Zecha                          H
> 
> SAP R/3 Project Services      
> Operations Services Center 
> Hewlett Packard GmbH                Telefon:    +49 7031/468 3423
> Schickardstrasse 25                       Fax:         +49 7031/468 1349
> D - 71034 Boeblingen                   e-mail:      Holger_Zecha@hp.com
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
