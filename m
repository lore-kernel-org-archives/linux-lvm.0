Message-ID: <CFBA5E82884BD411A02A00D0B76C124F028CE039@hvrrd11a.hvr.fsc.net>
From: "Laurenz, Dirk" <Dirk.Laurenz@fujitsu-siemens.com>
MIME-Version: 1.0
Subject: [linux-lvm] 2 Questions about Linux LVM
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
Date: Fri Mar 14 11:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello,

i have two questions concerning the linux lvm v1.x.x.

1. how log should (min and max) a volume group or logical volume name be.
2. Is it better to export and import a volume group between several systems,
   or is it enough to import a volume group once and activate it on the desired system for use
   while it has been deactivated on the others?

Here is a sort of graph, about what i mean:

before switch:
		SYS1				SYS2
activated	yes				no


after switch:
		SYS1				SYS2
activated	no				yes

Thanks for your help.

Kind regards


Dirk Laurenz
Systems Engineer	
Competence Center PRIMERGY Server Solutions
Fujitsu Siemens Computers
Hildesheimer Strasse 25
30880 Laatzen
Germany

Telephone:	+49 (511) 84 89 - 18 08
Telefax:	+49 (511) 84 89 - 28 99
Mobile:	+49 (170) 22 10 781
Email:	mailto:dirk.laurenz@fujitsu-siemens.com
Internet:	http://www.fujitsu-siemens.com
            http://www.fujitsu-siemens.de/rl/servicesupport/itdienstleistungen/competencecenter.html
*******************************************************************************************************************
