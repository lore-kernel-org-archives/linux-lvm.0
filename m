Subject: Re: [linux-lvm] cluster - lvm
Content-Type: multipart/alternative; boundary=Apple-Mail-1-262279890
MIME-Version: 1.0 (Apple Message framework v481)
From: Michael Clark <michael@metaparadigm.com>
In-Reply-To: <02b801c1d499$1ab21dd0$a6a5f88f@oboe>
Message-Id: <B1DCEC4B-416B-11D6-B381-000393843900@metaparadigm.com>
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
Date: Wed Mar 27 04:16:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Apple-Mail-1-262279890
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed

I'm using LVM in a cluster.

There are a few caveats. It does not support distributed updates
and locking on metadata so you must be extra careful when making
changes to logical volumes.

If you need to make any changes to logical volumes, you must do
it with only one host online. I have successfully done LVM metadata
updates in a cluster without rebooting nodes by unmounting all LVM
partitions on all nodes but one and also removing the SCSI module
(just to make sure nothing is cached). After performing the
LVM modifications on the remaining node, I then re-probe the SCSI
module on the other nodes and rerun vgscan. All seems okay and
the new volumes are detected.

What appears to be needed for better cluster support is at least some
simple locking on the metadata to enforce the single node exclusive
access to cluster metadata when performing changes, because at the
moment there are no checks on operations which could potentially
corrupt data.

~mc


On Tuesday, March 26, 2002, at 03:37 PM, shlim wrote:

> Hello.
> =A0
> Does the current LVM version support cluster system??
> =A0
> If LVM does not support cluster system. what is required to support=20
> that??
> =A0
> =A0
> =A0

--Apple-Mail-1-262279890
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=ISO-8859-1

I'm using LVM in a cluster.


There are a few caveats. It does not support distributed updates

and locking on metadata so you must be extra careful when making

changes to logical volumes.


If you need to make any changes to logical volumes, you must do

it with only one host online. I have successfully done LVM metadata

updates in a cluster without rebooting nodes by unmounting all LVM

partitions on all nodes but one and also removing the SCSI module

(just to make sure nothing is cached). After performing the

LVM modifications on the remaining node, I then re-probe the SCSI

module on the other nodes and rerun vgscan. All seems okay and

the new volumes are detected.


What appears to be needed for better cluster support is at least some

simple locking on the metadata to enforce the single node exclusive

access to cluster metadata when performing changes, because at the

moment there are no checks on operations which could potentially

corrupt data.


~mc



On Tuesday, March 26, 2002, at 03:37 PM, shlim wrote:


<excerpt><smaller>Hello.</smaller>

=A0

<smaller>Does the current LVM version support cluster system??</smaller>

=A0

<smaller>If LVM does not support cluster system. what is required to
support that??</smaller>

=A0

=A0

=A0

</excerpt>=

--Apple-Mail-1-262279890--
