Message-ID: <615A249B783CD41192F400D0B747AC860361D9C6@hesse.bbn.hp.com>
From: "ZECHA,HOLGER (HP-Germany,ex1)" <holger_zecha@hp.com>
Date: Thu, 23 Aug 2001 15:00:30 +0200
MIME-Version: 1.0
Subject: [linux-lvm] no lvm question but linux kernel
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

Hello,

hopefully somebody knows:

I tried to compile the newest Inter driver for EtherExpress Pro.
The compileation works fine but afterwards when I execute a modprobe i get
the followming errors:
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
unregister_netdev_Rsmp9caf1fb1
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
eth_type_trans_Rsmp5891d412
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
netif_rx_Rsmp8f1647ae
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
proc_net_Rsmp7841cd2d
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
create_proc_entry_Rsmp9d0ba5fe
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
__kfree_skb_Rsmp088bdac9
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
remove_proc_entry_Rsmpbb26f796
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
init_etherdev_Rsmp11b90d2b
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
skb_over_panic_Rsmp2ba81f79
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: unresolved symbol
alloc_skb_Rsmp40210a6a
/lib/modules/2.2.16-22SAPenterprise/net/e100.o: insmod
/lib/modules/2.2.16-22SAPenterprise/net/e100.o failed

Any idea ?

Holger Zecha                          H

SAP R/3 Project Services      
Operations Services Center 
Hewlett Packard GmbH                Telefon:    +49 7031/468 3423
Schickardstrasse 25                       Fax:         +49 7031/468 1349
D - 71034 Boeblingen                   e-mail:      Holger_Zecha@hp.com
