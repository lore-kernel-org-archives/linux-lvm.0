From: Spam <spam@tnonline.net>
Message-ID: <199870551.20031126190959@tnonline.net>
Subject: Re: [linux-lvm] LVM across network
In-Reply-To: <20031126165649.1fd1c51b.neuron@hollowtube.mine.nu>
References: <Pine.LNX.4.44.0311261511490.21217-100000@nymfe06.fi.muni.cz>
 <11659189187.20031126163948@tnonline.net>
 <20031126165649.1fd1c51b.neuron@hollowtube.mine.nu>
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
Date: Wed Nov 26 12:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: neuron <linux-lvm@sistina.com>

  As far as I can tell NBD 2.x is stable. You can setup failovers with
  NBD  if  you  have  more  than  one NIC in the computers. I have not
  tested this myself.

  The  risk  is  that you accidentally disconnect a network cable etc.
  Otherwise  it  is  up  to the stability of each machine to make this
  work in the long run. For temp space this is fine =).

  I  doubt  any  network  filesystem  will  allow  you to disconnect a
  machine  and still be able to operate. NFS etc support a reastart of
  the  machine,  but  you cannot consolidate the distributed diskspace
  into one logical volume.

  Give  NBD  a  try and test what happens if you disconnect a computer
  then reconnect it.

  I  am  using  NBD 2.0 in Gentoo Linux together with LVM and ReiserFS
  without any problems (so far).


> quick question about this, been looking for a good solution for
> this a long time.  Any filesystems that can loose connectivity?  I
> have a setup where I can't guarantee all the computers will stay
> stable, but it's only a setup for temporary storage anyway (1gb
> networks, temporary storage is for rendering files).

>> 
>>   Yes.  This is possible with NBD 2.0 and later (earlier nbd tools has
>>   limitation  of  4GB  per  shared  disk/volume/device).  You  need to
>>   compile the NBD (Network Block Device) module in the kernel too.
>> 
>>   Then simply run on the server (the machines hosting spare volumes):
>> 
>>     nbd-server  10000 /dev/hdax  (replace 10009 with the port you want
>>     to use)
>> 
>>   On  the  client  machine  (where  you want to run LVM to collect all
>>   space;
>> 
>>     nbd-client IP port /dev/nbd/0
>> 
>>   For  each  server  you connect simply change the IP/port and the NBD
>>   device number. After this you run "vgscan" and "vgchange -ay vg"
>> 
>>   You  should  be warned though. If you loose network connectivity you
>>   can end up with filesystem damage.
>> 
>> 
>> > Hello, 
>> > I have simple question. Is it possible run LVM across network ?
>> > For example, first disk on pc1, second on pc3, third on pc3...
>> > I need file system that colecting free space across network onto one
>> > point.
>> > Thank you, Marek Jan 
>> 
>> 
>> > _______________________________________________
>> > linux-lvm mailing list
>> > linux-lvm@sistina.com
>> > http://lists.sistina.com/mailman/listinfo/linux-lvm
>> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> 
>> 
>> 

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
