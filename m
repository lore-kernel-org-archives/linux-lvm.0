From: Jan Rhebergen <jan@rhebergen.net>
Subject: Re: [linux-lvm] how do i recover "lost" vg info?
Message-Id: <20031111212622.753c2f18.jan@rhebergen.net>
In-Reply-To: <20031111173043.4ad75d3b.jan@rhebergen.net>
References: <20031111173043.4ad75d3b.jan@rhebergen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Nov 11 14:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Some additional information regarding my earlier posting:

Seems like there is some configuration backup present in /etc/lvmconf/vg.conf detailing some information of the "lost" vg. It give the VG UUID, Free and Alloc PE etc. Unfortunately the reported free PE size does not seem as I remember it. It says there should be 10GB allocated and about 27GB free. As I remember it I allocated all. 

I don't dare to use this config file to "restore" things for fear of breaking things even more and thwarting my chances of a complete recovery.

Opinions?

regards,

Jan

-- 
Message originates from the laptop of:
  J.B Rhebergen, Scientist EM Effects, TNO-FEL
