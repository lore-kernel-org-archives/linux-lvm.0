From: Spam <spam@tnonline.net>
Message-ID: <751312142.20040114160809@tnonline.net>
Subject: Re: [linux-lvm] Moving a PV to a new, larger, disk.
In-Reply-To: <20040113162256.GA3756@redhat.com>
References: <1424171942.20040113154554@tnonline.net>
 <20040113162256.GA3756@redhat.com>
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
Date: Wed Jan 14 10:09:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <linux-lvm@sistina.com>


> On Tue, Jan 13, 2004 at 03:45:54PM +0100, Spam wrote:
>> 
>>   Hello,
>> 
>>   Is it possible to use dd/dd_rescue to simply copy a PV to a new disk
>>   that is slightly (16MiB)larger?
>> 
>>   The old pv is on /dev/hdb1 and the new disk is /dev/hdc and is
>>   unpartitioned so far. How would I proceed to make this work?

> Following procedure to make it happen:

> o partition the new disk with 1 partition of _exactly_
>   the same size (in units of sectors) as /dev/hdb1

> o dd(_rescue) content over
> o remove the old disk
> o vgscan
> o vgchange -ay

  Great! Thank you. Now I know who to blame if things does not work ;)

  //Anders

>>   
>>   This might seem odd to do as I could perhaps use pvmove, but pvmove
>>   requires the whole vg to be present in the system, right?
>> 
>>   //Anders
>> 
