From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] snapshots of busy ext2 file system corrupt
Message-Id: <2621690000.1014757084@tiny>
In-Reply-To: <m2bsecdouv.fsf@isnogud.escape.de>
References: <m28z9guz53.fsf@isnogud.escape.de>
    <20020226095919.F12832@lynx.adilger.int> <2412370000.1014745130@tiny>
    <m2bsecdouv.fsf@isnogud.escape.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Tue Feb 26 14:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


On Tuesday, February 26, 2002 08:28:40 PM +0100 Urs Thuermann <urs@isnogud.escape.de> wrote:

> Chris Mason <mason@suse.com> writes:
> 
>> For ext2, the best we could do would probably be a hack based on 
>> locking the super.  As far as I know, nobody is planning on this,
> 
> :-(
> 
>> especially given how easy it is to go from ext2->ext3.
> 
> Some performance tests I made with ext2, ext3, and reiserfs convinced
> me to stay with ext2.  ext3 was significantly slower than ext2 on some
> operations (and reiserfs even worse than that).

You trade speed for safety sometimes, but you can lower the performance
hit by mounting ext3 with -o data=writeback, and help both filesystems
by playing with bdflush values (increment the metadata timeout up from 5
seconds).

Other tuning depends on your app.

-chris
