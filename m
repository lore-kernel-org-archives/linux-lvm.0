Message-Id: <200203110826.g2B8Q6v17961@mailgate5.cinetic.de>
MIME-Version: 1.0
From: <gunther.kuhlmann@web.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] what happes to VG when disks are added/removed?
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
Date: Mon Mar 11 02:26:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello!

I had two hard disks, the first with three VG's, the second
with one VG (vg2). When the second hard disk started to fail, I
installed a third with VG vg4 and copied the data over. Then,
without deleting vg2, I unplugged hd 2. After reboot, the volume
on vg2 mounted cleanly, although the disk was not available. It
correctly accessed the LV on vg4 on the new disk. Is that correct?
Can I now use either of the two vg2/vg4 to access the LV on the
new disk? How do I get rid of one (and which) without risking my
data? Can I just vgremove vg2 away?

Thanks for your help!

Gunther


________________________________________________________________
Keine verlorenen Lotto-Quittungen, keine vergessenen Gewinne mehr! 
Beim WEB.DE Lottoservice: http://tippen2.web.de/?x=13
