Message-ID: <50A6588F.10402@redhat.com>
Date: Fri, 16 Nov 2012 16:15:27 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20121116124809.GA25670@jajo.eggsoft>
In-Reply-To: <20121116124809.GA25670@jajo.eggsoft>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] cluster request failed: Host is down
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jacek Konieczny <jajcus@jajcus.net>

Dne 16.11.2012 13:48, Jacek Konieczny napsal(a):
> Hi,
>
> I have seen this problem already reported here, but with no useful
> answer:
>
> http://osdir.com/ml/linux-lvm/2011-01/msg00038.html
>
> This post suggest it is some very old bug, a change which can be easily
> reverted=E2=80=A6 though, it is a bit hard to believe. Such an easy bug, =
would
> be already fixed, wouldn't it?
>
> For me the problem is as follows:
>
> I have a two node cluster with a volume group running on a DRBD in
> Master-Master setup. When I shut one node down, cleanly, I am not able
> to properly manage the volumes.
>
> LVs which are active on the surviving host remain active, but I am not
> able to deactivate them or activate more volumes:
>
>>   [root@dev1n1 ~]# lvs dev1_vg/4bwM2m7oVL
>>     cluster request failed: Host is down
>>     LV         VG        Attr      LSize Pool Origin Data%  Move Log Cop=
y%  Convert
>>     4bwM2m7oVL dev1_vg -wi------ 1.00g
>>   [root@dev1n1 ~]# lvchange -aey dev1_vg/XaMS0LyAq8 ; echo $?
>>     cluster request failed: Host is down
>>     cluster request failed: Host is down
>>     cluster request failed: Host is down
>>     cluster request failed: Host is down
>>     cluster request failed: Host is down
>>   5
>>   [root@dev1n1 ~]# lvs dev1_vg/4bwM2m7oVL
>>     cluster request failed: Host is down
>>     LV         VG        Attr      LSize Pool Origin Data%  Move Log Cop=
y%  Convert
>>     4bwM2m7oVL dev1_vg -wi------ 1.00g
>>   [root@dev1n1 ~]# lvchange -aen dev1_vg/XaMS0LyAq8 ; echo $?
>>     cluster request failed: Host is down
>>     cluster request failed: Host is down
>>   5
>>   [root@dev1n1 ~]# lvs dev1_vg/XaMS0LyAq8
>>     cluster request failed: Host is down
>>     LV         VG        Attr      LSize Pool Origin Data%  Move Log Cop=
y%  Convert
>>     XaMS0LyAq8 dev1_vg -wi-a---- 1.00g
>>
>>   [root@dev1n1 ~]# dlm_tool ls
>>   dlm lockspaces
>>   name          clvmd
>>   id            0x4104eefa
>>   flags         0x00000000
>>   change        member 1 joined 0 remove 1 failed 0 seq 2,2
>>   members       1
>>
>>   [root@dev1n1 ~]# dlm_tool status
>>   cluster nodeid 1 quorate 1 ring seq 30648 30648
>>   daemon now 1115 fence_pid 0
>>   node 1 M add 15 rem 0 fail 0 fence 0 at 0 0
>>   node 2 X add 15 rem 184 fail 0 fence 0 at 0 0
>
> The node has cleanly left the lockspace and the cluster. DLM is aware
> about that, so should be clvmd, right? And if all other cluster nodes
> (only one here) are clean, all LVM operations on the clustered VG should
> work, right? Or am I missing something?
>
> The behaviour is exactly the same when I power off a running node. It
> is fenced by dlm_tool, as expected and then the VG is non-functional as
> above, until the dead node is up again and joins the cluster.
>
> Is this the expected behaviour or is it a bug?


Cluster with just 1 node is not a cluster (no quorum)

So you may either drop locking --config 'global {locking_type =3D 0}'
or fix the dropped node.  Since you are admin of the system you
know what to do - system itself unfortunately cannot determine,
whether the node A is master or node B is master (both could
be alive, just Internet connection between them could be failing).
So it's admin responsibility to take proper action.

Zdenek
