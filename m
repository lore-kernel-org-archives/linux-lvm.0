Message-ID: <3F68AE62.7000103@tupshin.com>
From: Tupshin Harper <tupshin@tupshin.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvscan showing 0 free on all PV's.
References: <3F679A44.6121.CED1C6A@localhost>
In-Reply-To: <3F679A44.6121.CED1C6A@localhost>
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
Date: Wed Sep 17 13:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Rene Olsen wrote:

> So what I should do is the following:
>
> Lets say the 200GB disc is 6000 PE's big.
>
> e2fsadm -v -l -6076 /dev/vol1/lv_vol

yup,

> This should make the lvm 200GB smaler.
>
> Then after that I do
>
> pvmove /dev/hdh1

Not yet. e2fsadm reduced the size of the filesystem. But you need to 
then reduce the sze of the lvm with:
lvreduce -l 6076 /dev/vol1/lv_vol
Then use the pvmove command.

-Tupshin
