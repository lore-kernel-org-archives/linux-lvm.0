From: Dax Kelson <dax@gurulabs.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1038010621.1623.13.camel@mentor>
Mime-Version: 1.0
Subject: [linux-lvm] 2.5.49 device mapper compile failure
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
Date: Fri Nov 22 18:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: dm@uk.sistina.com
Cc: linux-lvm@sistina.com


 - device mapper using vcalloc() even though no such function has ever 
   existed in the kernel (it's vmalloc + memset()).
