MIME-Version: 1.0
From: Pierrick PONS <ppons@cvf.fr>
Message-Id: <E16Sist-000136-00@arwen.dev33.cvf>
Subject: [linux-lvm] extending a logical volume
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
Date: Mon Jan 21 12:10:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've read the extending logical volume section and I can't believe this.
According to the doc, it would be impossible to extend a logical volume 
without unmounting it first.
I'm using a ext3 (with a 2.4.17 kernel) filesystem and I'd like to extend my 
logical volume without unmounting it first. This would be used on a production 
server, so I can't unmount any logical volume.

I've seen that a ext2online patch does exist, maybe this fonctionnality is 
still implemented in a newer kernel ?

Could you give me, if it exists, a method to extend the size without unmount 
the logical volume ?

Thank's a lot.


Pierrick
