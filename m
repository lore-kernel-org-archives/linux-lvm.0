Message-ID: <3E673068.7E5905D4@tid.es>
From: Miguel =?iso-8859-1?Q?Gonz=E1lez=20Casta=F1os?= <mgc@tid.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM and transferring filesystem
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
Date: Thu Mar  6 05:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

dear all,

 I am installing a redhat 7.3 linux box with X-Window.

 I have installed LVM splitting the system with the following scheme:

 /boot and / are installed each in different non-LVM partitions.

 LVM volumes:

 /usr , /var/ , /tmp

 I have noticed that when I mount the filesystem using the LVM volumes
my X-Windows server doesnt work, but when I deactivate the LVM volumes
using the original configuration stored in the original / partition
(which still have the original /var, /tmp, /usr partitions) then
X-Window works perfectly.

 Then I assume that I havent transferred the filesystem well.

 I use from / the following command from the LVM howtos:

 tar cplf - -C var .|tar xvlf - -C /mnt/var

 and the same thing for the rest of partitions.

 Any suggestion?

 Many thanks in advance

 Miguel
