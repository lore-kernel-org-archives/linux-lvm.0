Message-ID: <3FE21F49.9060602@onsitetech.com>
From: Ian Burrell <ib@onsitetech.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Reclaim free space
References: <3FE21CA1.6040201@onsitetech.com>
In-Reply-To: <3FE21CA1.6040201@onsitetech.com>
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
Date: Thu Dec 18 15:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Ian Burrell wrote:
> How do I reclaim the free space when a logical volume is reduced?  I am 
> using a volume group on one physical volume and three logical volumes.
> 

I figured out my problem.  I had a test logical volume that was taking 
up the space.  I removed it and everything is working fine.

  - Ian
