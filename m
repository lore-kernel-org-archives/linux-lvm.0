From: Anders Widman <andewid@tnonline.net>
Message-Id: <147246562.20020304123407@tnonline.net>
Subject: Re: [linux-lvm] pvmove -i does not work..
In-Reply-To: <20020304110128.A10007@sistina.com>
References: <13526423765.20020304010840@tnonline.net>
    <20020304110128.A10007@sistina.com>
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
Date: Mon Mar  4 05:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I guess not. It is lvmtools 1.0.3 with the patch to move beyond 2GB
limit.

//Anders



> On Mon, Mar 04, 2002 at 01:08:40AM +0100, Anders Widman wrote:
>> Has anyone tried pvmove -i on a faulty disk (bad blocks)?
>> 
>> pvmove -i /dev/crashed /dev/new stops when it hits the bad blocks.
>> This wasn't so bad for me this time as I could use dd to move
>> everything from the bad disk to my new disk...

> Is that with the llseek patch for liblvm.h in?

>> 
>> //Anders
>> 
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@sistina.com
>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
