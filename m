From: Anders Widman <andewid@tnonline.net>
Message-ID: <17818697062.20021119203901@tnonline.net>
Subject: Re: [linux-lvm] Whole Disk Usage with LVM ...
In-Reply-To: <2D92FEBFD3BE1346A6C397223A8DD3FC092096@THOR.goeci.com>
References: <2D92FEBFD3BE1346A6C397223A8DD3FC092096@THOR.goeci.com>
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
Date: Tue Nov 19 13:39:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Murthy Kambhampaty <linux-lvm@sistina.com>

> On Sat Nov 16 20:07:02 2002, Goetz Bock  linux-lvm@sistina.com wrote:
>>On Sat, Nov 16 '02 at 14:46, david@lownoisefloor.com wrote:
>>> I am using entire disks.  
>>Bad idea, why don't you want to at last put a partition table on it,
>>with one big partition, that uses the whole disk ... or is this what you
>>had in mind?
> Err, is there a reason why this is a bad idea? 

It  may  upset some tools that do not know how to handle disks without
partition   tables. They will either think the disks are empty or have
broken tables, or just malfunction and crash...

Normally though, there are no problems doing LVM on whole volumes.


> Thanks,
>         Murthy

> (The HOWTO actually gives the example of
> # pvcreate /dev/hdb
> without saying this is a bad idea; or a good one, for that matter.) 

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
