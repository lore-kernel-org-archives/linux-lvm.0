References: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
	<080c04ff-e9cc-8a9e-da66-2c125a657d86@nebelschwaden.de>
	<28fac0e3-5853-76e2-5f9f-c4ae7b35c4a8@nebelschwaden.de>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <bdbb0195-8b35-f732-1db8-641c3fbdc20f@redhat.com>
Date: Mon, 13 Jan 2020 16:02:06 +0100
MIME-Version: 1.0
In-Reply-To: <28fac0e3-5853-76e2-5f9f-c4ae7b35c4a8@nebelschwaden.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] metadata device too small
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: listac@nebelschwaden.de, LVM general discussion and development <linux-lvm@redhat.com>

On 1/11/20 11:07 PM, Ede Wolf wrote:

>>> Is there any way to make the data accessible again?
>>>
>>> lvm2 2.02.186

lvm2 version is not that important in this case, you will want to try a 
newer thin-provisioning-tools package.

I see the newest version in Ubuntu is 0.7.6 while upstream is at 0.8.5 
with some bugs in thin metadata repair fixed.

You can compile yourself, or could try using e.g. live Fedora 31 with up 
to date package.

-- Marian


>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
