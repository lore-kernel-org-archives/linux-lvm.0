From: Spam <spam@tnonline.net>
Message-ID: <366082581.20040116010404@tnonline.net>
Subject: Re: [linux-lvm] JFS or XFS
In-Reply-To: <1074209631.19419.24.camel@david.internal.NorcrossGroup.com>
References: <20040115231819.49123.qmail@web41506.mail.yahoo.com>
 <20040116002242.47690445@souldaemon>
 <1074209631.19419.24.camel@david.internal.NorcrossGroup.com>
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
Date: Thu Jan 15 19:02:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Greg Freemyer <linux-lvm@sistina.com>


> On Thu, 2004-01-15 at 18:22, neuron wrote:
>> reiserfs, guaranteed personally.  Especially on a mail server.

> I agree, reiserfs was tuned for handling lots of small files.  Sounds
> perfect for a mail server.

  Also,  ReiserFS  tools  are  very mature when it comes to repair and
  recover  from  damages. I do not know how the JFS/XFS tools are, but
  it  would  be  a good idea to investigate how you can repair your FS
  _if_ you end up with some sort of failure..

>> I've used jfs, I crashed it twice on purpose (network swap,
>> then disable network card), both times jfs failed to boot.  (this
>> is because it trusts it's own journal, which a lot of people love
>> about it, both times for me it was wrong..)
>> Personally I haven't had any problems with XFS though, but I haven't used it that much.
>> 

> If you go with XFS, stay away from anything older than 1.3.1.

> The 1.2 and prior releases had this really nice feature that they
> ignored the sync command (and fsync I think).

> The end result is that with a power outage or kernel lockup you could
> lose lots of work.  I had one failure on a lightly used machine that had
> a whole days activities still sitting in the OS disk cache when the
> kernel locked up.

> This is fixed in 1.3.1, 

> Greg




> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
