Subject: Re: [linux-lvm] understanding snapshot
Mime-Version: 1.0 (Apple Message framework v553)
From: "Dale J. Stephenson" <dalestephenson@mac.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <1074199517.2443.27.camel@rich>
Message-Id: <926E5FAA-47DF-11D8-AC51-0003937830E4@mac.com>
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
Date: Thu Jan 15 23:52:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

On Thursday, January 15, 2004, at 03:45  PM, Rich Turner wrote:
[...]
> what will happen to the backup process (tar for example) of a snapshot
> lv when it runs out of storage?
>
Reads from the snapshot will return I/O errors.  The backup process 
will likely fail.

> do chunks contain the metadata for the data in the original lv?
>
If metadata is written to the original lv, then yes.

> what is the effect of increasing/reducing the chunk size?
>
Depending on your write pattern, smaller chunk sizes may make the 
snapshot use space more slowly.  (If you write even 1K to a 4 MB chunk, 
the whole chunk will be copied.)  But it will also cause there to be 
more physical chunks to exist in a snapshot volume of the same size.  
Using LVM1 I ran into problems with snapshots eating up precious 
vmalloc memory, so I tend to use a large snapshot chunk size.  YMMV.

Dale J. Stephenson
dalestephenson@mac.com
