Message-ID: <21E8E34076807C41A646FDC666B15BDF087699@minna.combox.de>
From: Tobias Gablunsky <T.Gablunsky@cbxnet.de>
MIME-Version: 1.0
Subject: [linux-lvm] LVM and RAID
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
Date: Tue Nov  4 07:56:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi all!

I didn't find clear information about how to use LVM on an (Software)
RAID-Mirror (or RAID-5). All I found, were problems: LVM uses Partition Type
0x8E but Linux Soft-RAID uses 0xFD - this dosn't look very compatible... A
solution would be to use Hardware-RAID of course. But I'm wondering if there
is a way to use Software-RAID and LVM together - I cannot believe that I am
the first one with this question! Am I?


tobias gablunsky
systemtechnik internet

CBXNET combox internet service gmbh
potsdamer strasse 96 | 10785 berlin
tel: +49 (30) 5 900 6 900 
fax: +49 (30) 5 900 6 999 
www.cbxnet.de | support@cbxnet.de
