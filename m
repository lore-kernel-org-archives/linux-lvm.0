From: "Tom Walcott" <tom_walcott@hotmail.com>
Mime-Version: 1.0
Message-ID: <F19741gcljD2E2044cY00004523@hotmail.com>
Subject: [linux-lvm] LVM2 modifies the buffer_head struct?
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
Date: Tue Jul  2 08:41:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, linux-kernel@vger.kernel.org

Hello,

Browsing the patch submitted for 2.4 inclusion, I noticed that LVM2 modifies 
the buffer_head struct. Why does LVM2 require the addition of it's own 
private field in the buffer_head? It seems that it should be able to use the 
existing b_private field.

How does that extra field affect performance relative to the cache? Won't 
any negative effects be seen by everything that uses buffer_heads? Also, as 
I understand the slab code and hardware cache alignment, won't the addition 
of the new field cause the each buffer_head to consume 128 bytes instead of 
96?

Just curious to know why this field was added, when the buffer_head already 
had a field for this purpose.

-Tom



_________________________________________________________________
Chat with friends online, try MSN Messenger: http://messenger.msn.com
