From: Spam <spam@tnonline.net>
Message-ID: <19162796968.20031122174903@tnonline.net>
Subject: Re: [linux-lvm] reiserfs_resize and lvreduce
In-Reply-To: <20031122161458.GA19543@localhost>
References: <20031122160606.A1247@wagener.nu> <20031122161458.GA19543@localhost>
MIME-Version: 1.0
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
Date: Sat Nov 22 10:50:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jose Luis Domingo Lopez <linux-lvm@sistina.com>


> On Saturday, 22 November 2003, at 16:06:06 +0100,
> Tobias Wagener wrote:

>> I want to reduce a LV. My question is, will reiserfs_resize move used
>> blocks in the "reduce"-area on my LV to unused blocks? Or must I do this
>> for my own by hand? And if how? 
>> 
> I always do it by hand , firts reducing the filesystem to the desired
> final size (using resize_reiserfs) and then reducing th LV size to
> something larger than the above.

> I usually try "lvreduce" with "--test" first, to see the final LV size,
> and check if it is larger than the filesystem, and the repeat the above
> command once I am sure it will not break anything.

  And  then  you can run reiserfs_resize again to use up the last MB's
  that you lost. Quite simple and efficient.
  

> Greetings.
