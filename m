From: kyi <kyi@kyi.sytes.net>
Message-Id: <1042570161.1375.8.camel@Jayson>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm root filesystem
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
Date: Tue Jan 14 12:48:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello all;

	I'm trying to get my newly installed gentoo system to have it's root
filesystem on lvm. I have a 25M /boot (sda1) and my other 3 drives are
all one big lv (/dev/vg0/lv0). I followed some docs I found through
google about doing this. I created my initrd.gz file with the following
lvmcreate_initrd 2.4.19-gentoo-r10 and it was created with error. I
edited my lilo.conf file to load these and re-ran lilo. Could someone
please point me in the right direction or to the docs on getting this
working. 

Any help is very much apperciated.
Thanks in advance

- Jayson Garrell

-- 
kyi <kyi@kyi.sytes.net>
