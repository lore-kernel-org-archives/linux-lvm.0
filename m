Message-Id: <3C434EB9.8060504@liberate.com>
From: Chris Worley <cworley@liberate.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] reiserfs oops at init
References: <3C431A01.1000606@liberate.com> <451550000.1011030447@tiny>
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
Date: Mon Jan 14 15:11:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Chris Mason wrote:

>>>If you want to send the errors from reiserfsck --check, I can confirm
>>>things a little better.
>>>
>>
>>It's going to be a big file... do you just want the tail?
>>
>>
> 
> Lets start with the tail, my internet connection isn't that hot right now.


Every error I could see was of the form:

bad_directory_item: block 141874: item 698385 744805 0x1 DIR (3), len 
350, location 2576 entry count 14, fsck need 0, format old has entry 
".." with wrong deh_state 140744 - expected 4 - fixed

This goes on for ~11MB.

The tail is:

free block count 3306944 mismatches with a correct one 4783644.
on-disk bitmap does not match to the correct one. 1476700 bits differ

With the new reiserfs version, it actually says "fixed", the older 
version didn't say that (except at the beginning), and I don't think 
they really fixed anything.

Although those "free block count mismatch/correct" numbers look like 
they did for all previous runs, this run with the new software said 
nothing of (something like) "10 ... must be fixed with 
--rebuild-tree".  It still doesn't boot.

On to the "--rebuild-tree" pass.  Wish me luck.

Chris
