From: Spam <spam@tnonline.net>
Message-ID: <6557103468.20031117194401@tnonline.net>
Subject: Re: [linux-lvm] Performance problem.
In-Reply-To: <20031117193054.5dd7eec1.neuron@hollowtube.mine.nu>
References: <3FB8F8A1.1060004@clin.ucl.ac.be>
 <1069087854.2408.0.camel@localhost.localdomain>
 <20031117181007.00e15a29.neuron@hollowtube.mine.nu>
 <3252989968.20031117183528@tnonline.net>
 <20031117191324.2047dbf3.neuron@hollowtube.mine.nu>
 <11955855390.20031117192313@tnonline.net>
 <20031117193054.5dd7eec1.neuron@hollowtube.mine.nu>
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
Date: Mon Nov 17 12:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: neuron <linux-lvm@sistina.com>


>>   No,  that  is  true.  Your low read speed does indicate that you are
>>   not  using  DMA.  Give  us  the  output of "hdparm /dev/hda". Also a
>>   simple  benchmark is to do "dd_rescue /dev/hda /dev/null". What does
>>   that give you in numbers?

> /dev/hdd:
>  multcount    = 16 (on)
>  IO_support   =  1 (32-bit)
>  unmaskirq    =  0 (off)
>  using_dma    =  1 (on)
>  keepsettings =  0 (off)
>  readonly     =  0 (off)
>  readahead    =  8 (on)
>  geometry     = 14589/255/63, sectors = 234375000, start = 0

  This  looks good. You could try -c3 to enable 32-bit w/sync and also
  enable  Write  cache  -W1 (this may and many not be wise in case you
  have power failures often).

> the cables are new (I thought that they may be a problem), I've
> gotten far better speeds on the same system and a worse system
> before I used lvm on the same drives.  I REALLY doubt there's
> something wrong with the drives (I replaced one of them because of
> an error, and looked for trouble after replacing that one, but
> didn't find anything else).

> And that dd_rescue will read from /dev/hda and write to /dev/null
> right?  Meaning it's a read test, and not a write test (= I won't
> loose any data on it ;) ).

  Yes,  it  is a read-only test! Read the manpage to get all flags you
  can use with it (such as how big blocks it is to read etc).


> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
