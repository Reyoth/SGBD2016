﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ClientWCF.ServiceWCF {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="CompositeType", Namespace="http://schemas.datacontract.org/2004/07/BiblioService")]
    [System.SerializableAttribute()]
    public partial class CompositeType : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private bool BoolValueField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string StringValueField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public bool BoolValue {
            get {
                return this.BoolValueField;
            }
            set {
                if ((this.BoolValueField.Equals(value) != true)) {
                    this.BoolValueField = value;
                    this.RaisePropertyChanged("BoolValue");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string StringValue {
            get {
                return this.StringValueField;
            }
            set {
                if ((object.ReferenceEquals(this.StringValueField, value) != true)) {
                    this.StringValueField = value;
                    this.RaisePropertyChanged("StringValue");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="EXE_AllExemplaireBIB_Id_Result", Namespace="http://schemas.datacontract.org/2004/07/BiblioService")]
    [System.SerializableAttribute()]
    public partial class EXE_AllExemplaireBIB_Id_Result : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int BIB_IDField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string EXE_CodeField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string EXE_DateAchatField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int EXE_IdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private System.Nullable<bool> EXE_IndisponibleField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int LIV_IdField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int BIB_ID {
            get {
                return this.BIB_IDField;
            }
            set {
                if ((this.BIB_IDField.Equals(value) != true)) {
                    this.BIB_IDField = value;
                    this.RaisePropertyChanged("BIB_ID");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string EXE_Code {
            get {
                return this.EXE_CodeField;
            }
            set {
                if ((object.ReferenceEquals(this.EXE_CodeField, value) != true)) {
                    this.EXE_CodeField = value;
                    this.RaisePropertyChanged("EXE_Code");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string EXE_DateAchat {
            get {
                return this.EXE_DateAchatField;
            }
            set {
                if ((object.ReferenceEquals(this.EXE_DateAchatField, value) != true)) {
                    this.EXE_DateAchatField = value;
                    this.RaisePropertyChanged("EXE_DateAchat");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int EXE_Id {
            get {
                return this.EXE_IdField;
            }
            set {
                if ((this.EXE_IdField.Equals(value) != true)) {
                    this.EXE_IdField = value;
                    this.RaisePropertyChanged("EXE_Id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Nullable<bool> EXE_Indisponible {
            get {
                return this.EXE_IndisponibleField;
            }
            set {
                if ((this.EXE_IndisponibleField.Equals(value) != true)) {
                    this.EXE_IndisponibleField = value;
                    this.RaisePropertyChanged("EXE_Indisponible");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int LIV_Id {
            get {
                return this.LIV_IdField;
            }
            set {
                if ((this.LIV_IdField.Equals(value) != true)) {
                    this.LIV_IdField = value;
                    this.RaisePropertyChanged("LIV_Id");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceWCF.IService1")]
    public interface IService1 {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService1/GetData", ReplyAction="http://tempuri.org/IService1/GetDataResponse")]
        string GetData(int value);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService1/GetData", ReplyAction="http://tempuri.org/IService1/GetDataResponse")]
        System.Threading.Tasks.Task<string> GetDataAsync(int value);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService1/GetDataUsingDataContract", ReplyAction="http://tempuri.org/IService1/GetDataUsingDataContractResponse")]
        ClientWCF.ServiceWCF.CompositeType GetDataUsingDataContract(ClientWCF.ServiceWCF.CompositeType composite);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService1/GetDataUsingDataContract", ReplyAction="http://tempuri.org/IService1/GetDataUsingDataContractResponse")]
        System.Threading.Tasks.Task<ClientWCF.ServiceWCF.CompositeType> GetDataUsingDataContractAsync(ClientWCF.ServiceWCF.CompositeType composite);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService1/EXE_AllExemplaireBIB_Id", ReplyAction="http://tempuri.org/IService1/EXE_AllExemplaireBIB_IdResponse")]
        ClientWCF.ServiceWCF.EXE_AllExemplaireBIB_Id_Result[] EXE_AllExemplaireBIB_Id(int BibId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService1/EXE_AllExemplaireBIB_Id", ReplyAction="http://tempuri.org/IService1/EXE_AllExemplaireBIB_IdResponse")]
        System.Threading.Tasks.Task<ClientWCF.ServiceWCF.EXE_AllExemplaireBIB_Id_Result[]> EXE_AllExemplaireBIB_IdAsync(int BibId);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IService1Channel : ClientWCF.ServiceWCF.IService1, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class Service1Client : System.ServiceModel.ClientBase<ClientWCF.ServiceWCF.IService1>, ClientWCF.ServiceWCF.IService1 {
        
        public Service1Client() {
        }
        
        public Service1Client(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public Service1Client(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public Service1Client(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public Service1Client(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string GetData(int value) {
            return base.Channel.GetData(value);
        }
        
        public System.Threading.Tasks.Task<string> GetDataAsync(int value) {
            return base.Channel.GetDataAsync(value);
        }
        
        public ClientWCF.ServiceWCF.CompositeType GetDataUsingDataContract(ClientWCF.ServiceWCF.CompositeType composite) {
            return base.Channel.GetDataUsingDataContract(composite);
        }
        
        public System.Threading.Tasks.Task<ClientWCF.ServiceWCF.CompositeType> GetDataUsingDataContractAsync(ClientWCF.ServiceWCF.CompositeType composite) {
            return base.Channel.GetDataUsingDataContractAsync(composite);
        }
        
        public ClientWCF.ServiceWCF.EXE_AllExemplaireBIB_Id_Result[] EXE_AllExemplaireBIB_Id(int BibId) {
            return base.Channel.EXE_AllExemplaireBIB_Id(BibId);
        }
        
        public System.Threading.Tasks.Task<ClientWCF.ServiceWCF.EXE_AllExemplaireBIB_Id_Result[]> EXE_AllExemplaireBIB_IdAsync(int BibId) {
            return base.Channel.EXE_AllExemplaireBIB_IdAsync(BibId);
        }
    }
}
