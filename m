Message-ID: <3CFB65F3.2030109@lausch.at>
From: Michael Lausch <mla@lausch.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SuSE Linux and EMC/XP/VA7100/VA7100
References: <615A249B783CD41192F400D0B747AC8606045009@hesse.bbn.hp.com>
Content-Transfer-Encoding: 7bit
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
Date: Mon Jun  3 07:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

ZECHA,HOLGER (HP-Germany,ex1) wrote:
> Hello,
> 
> has anyone detailed experience connecting a SuSE Linux to a
> EMC,XP,VA7100,VA7400 using Emulex FC cards and configuring LVM ?

if you mean with XP HP's XP256 or comparable, i found the following:

Setup
HP lpr1000 1U server.
QLogic FCal Card
Brocade FCAL switches
XP256 with 1,5 TByte in ~7 Gig slices.

the problems which prohibited us from using this setup in a production 
environment:
Linux could not scan all the LUNS and SCSI ID's without kernel modification.

The mapping from LDEVs to SCSI-ID/LUN could not be performed in a 
reliabel way on the linux box. Since the XP256 was shared between 
different servers (Sun Solaris) this was the showstopper. We could never 
be certain which ID/LUN corresponds to which LDEV (7 GByte Slice).




> 
> Thanks for your help
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
> 
