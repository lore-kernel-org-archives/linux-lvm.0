From: <narm@go.com.jo>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20031202031433.DHOQ11377.front-mail@[172.16.1.237]>
Subject: [linux-lvm] LVM2 2.6.0-test11
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
Date: Mon Dec  1 21:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have managed to compile 2.6.0-test11 patched with the latest patch <thornber> and the new device-mapper and new LVM2 tools and everything is ok, I boot and everything is fine until the filesystem check!! I get this error
fsck.ext3
No such device or address while trying to open /dev/V00/LV00Root

yes may root is on lvm1, when I boot from 2.4.22 <lvm1> there is no problem with my root boots fine here.

any help
Thank you
Basem
