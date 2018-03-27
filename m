References: <597ba4e4-2028-ed62-6835-86ae9015ea5b@assyoma.it>
	<c5d1945b-a58e-4e4a-4f0f-83b32635b250@redhat.com>
	<3aa5c210-13f1-02d7-6fec-79762087325c@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <12b56776-daf3-12e3-1847-f381fa52f1d0@redhat.com>
Date: Tue, 27 Mar 2018 14:52:25 +0200
MIME-Version: 1.0
In-Reply-To: <3aa5c210-13f1-02d7-6fec-79762087325c@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Higher than expected metadata usage?
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 27.3.2018 v 13:05 Gionatan Danti napsal(a):
> On 27/03/2018 12:39, Zdenek Kabelac wrote:
>> Hi
>>
>> And last but not least comment -=EF=BF=BD when you pointed out 4MB exten=
t usage -=20
>> it's relatively huge chunk - and if the 'fstrim' wants to succeed - thos=
e=20
>> 4MB blocks fitting thin-pool chunks needs to be fully released. >
>> So i.e. if there are some 'sparse' filesystem metadata blocks places - t=
hey=20
>> may prevent TRIM to successeed - so while your filesystem may have a lot=
 of=20
>> free space for its data - the actually amount if physically trimmed spac=
e=20
>> can be much much smaller.
>>
>> So beware if the 4MB chunk-size for a thin-pool is good fit here....
>> The smaller the chunk is - the better change of TRIM there is...
>=20
> Sure, I understand that. Anyway, please note that 4MB chunk size was=20
> *automatically* chosen by the system during pool creation. It seems to me=
 that=20
> the default is to constrain the metadata volume to be < 128 MB, right?

Yes - on default lvm2 'targets' to fit metadata into this 128MB size.

Obviously there is nothing like  'one size fits all' - so it really the use=
r=20
thinks about the use-case and pick better parameters then defaults.

Size 128MB is picked to have metadata that easily fit in RAM.

>> For heavily fragmented XFS even 64K chunks might be a challenge....
>=20
> True, but chunk size *always* is a performance/efficiency tradeoff. Makin=
g a=20
> 64K chunk-sided volume will end with even more fragmentation for the=20
> underlying disk subsystem. Obviously, if many snapshot are expected, a sm=
all=20
> chunk size is the right choice (CoW filesystem as BTRFS and ZFS face simi=
lar=20
> problems, by the way).


Yep - the smaller the chunk is - the less 'max' size of data device can be =

supported as there is final number of chunks you can address from maximal=20
metadata size which is ~16GB and can't get any bigger.

The bigger the chunk is - the less sharing in snapshot happens, but it gets=
=20
less fragments.

Regards

Zdenek
