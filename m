From: NagyZ <nagyz@piarista-kkt.sulinet.hu>
Message-ID: <Pine.LNX.4.44.0210190006040.21759-100000@server.piarista-kkt.sulinet.hu>
MIME-Version: 1.0
Subject: [linux-lvm] system crash caused by lvm's fault?
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
Date: Fri Oct 18 17:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hi!

i have 1 VG with 5-6 LV.
when one of my disks dont get enough power and 'fell out', then my ftp 
processes get to state 'detach', and even kill -9 cant kill them..
load is starting to get higher, and higher, and then VM says not enought 
memory.. and kernel crashes.
it is on p4, with 512MB ram, with 906G VG..

can i avoid this crash?
i mean, when one disk fell off, then how can i kill this processes, and 
unmount the lvs? any idea?

NagyZ
