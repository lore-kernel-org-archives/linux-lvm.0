From: Gashaw Teshome <gasht@neopets.com>
Subject: Re: [linux-lvm] Snapshot sizes
Date: Wed, 29 Aug 2001 17:19:10 -0700
References: <20010829173123.A10331@sistina.com>
In-Reply-To: <20010829173123.A10331@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E15cFXf-0005aa-00@hermes.sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Make sense?

I  think so.  So, if I create a LV of (let's say) 100M, take a snapshot and 
then do my backup, as long as no changes have occured in excess of that 100M
I'll be fine.  The total size of the files on the original LV doesn't matter 
as long as I allocate enough space for the snapshot LV.

Do I have it right?

On Wednesday 29 August 2001 03:31 pm, AJ Lewis wrote:
> You need enough room in the snapshot to store all the changes written to
> the
> disk from the time you take the snapshot to the time you finish backing
> it
> up.  What happens is that when there is a write pending to the original
> LV,
> we first copy the original data to the snapshot LV, then write the new
> data
> to the original LV.  The snapshot only stores the changed data.  It
> redirects any queries of data that hasn't changed back to the data
> stored on the original LV.  Make sense?
>
> There is more detailed information at:
> http://tech.sistina.com/lvm/doc/lvm_howto/Taking_a_backup_using_sna.html
> #sec:Snapshots_Backup
>
> Regards,

-- 
Gashaw Teshome
System Administrator
Neopets.com
